import 'dart:developer';
import 'package:get/get.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/services/api_service.dart';

class ProductController extends GetxController {
  RxList<Product> allProducts = <Product>[].obs;
  RxList<Product> filteredProducts = <Product>[].obs;

  RxString selectedExamCategory = ''.obs;
  RxString selectedTag = ''.obs;

  Rx<Product?> selectedProduct = Rx<Product?>(null);
  RxDouble discount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    try {
      final res = await ApiService.fetchProducts();
      allProducts.assignAll(res);
      filterProducts();
    } catch (e) {
      log("Failed to load products: $e");
    }
  }

  void selectExamCategory(String category) {
    selectedExamCategory.value = category;
    filterProducts();
  }

  void selectProduct(Product product) {
    selectedProduct.value = product;
    discount.value = 0.0;
  }

  void selectTag(String tag) {
    if (selectedTag.value == tag) {
      selectedTag.value = '';
    } else {
      selectedTag.value = tag;
    }
    filterProducts();
  }

  void filterProducts() {
    filteredProducts.assignAll(
      allProducts.where((product) {
        final matchesTag =
            selectedTag.value.isEmpty ||
            product.tags.contains(selectedTag.value);
        return matchesTag;
      }).toList(),
    );
  }

  void applyCoupon(String code) {
    if (code == 'MemoNeetAchiever' &&
        selectedProduct.value != null &&
        selectedProduct.value!.discountedPrice >= 400) {
      discount.value = 300.0;
      log("Coupon applied: ₹300 off");
    } else {
      discount.value = 0.0;
      log("Coupon not applied.");
    }
  }

  double igst() {
    if (selectedProduct.value == null) return 0.0;
    return selectedProduct.value!.discountedPrice * 0.05;
  }

  double total() {
    if (selectedProduct.value == null) return 0.0;
    return selectedProduct.value!.discountedPrice + igst() - discount.value;
  }
}
