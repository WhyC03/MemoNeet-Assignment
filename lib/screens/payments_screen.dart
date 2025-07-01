import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoneet_assignment/controller/product_controller.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/screens/empty_cart_screen.dart';
import 'package:memoneet_assignment/screens/payment_failure_screen.dart';
import 'package:memoneet_assignment/screens/payment_successfull_screen.dart';
import 'package:memoneet_assignment/screens/product_detail_screen.dart';
import 'package:memoneet_assignment/theme.dart';
import 'package:memoneet_assignment/widgets/custom_button_two.dart';
import 'package:memoneet_assignment/widgets/custom_container.dart';
import 'package:dotted_border/dotted_border.dart';

class PaymentsScreen extends StatefulWidget {
  final Product product;

  static route(Product product) {
    return MaterialPageRoute(builder: (context) => PaymentsScreen(product));
  }

  const PaymentsScreen(this.product, {super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final ProductController productController = Get.find<ProductController>();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // productController = Get.find<ProductController>();
    // controller = TextEditingController();
    productController.selectProduct(widget.product);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              ProductDetailScreen.route(
                productController.selectedProduct.value!,
              ),
              (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmptyCartScreen()),
              );
            },
            child: Row(
              children: [
                Icon(Icons.shopping_cart, color: color1),
                SizedBox(width: 5),
                Text("Share", style: TextStyle(fontSize: 18, color: color1)),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        final selectedProduct = productController.selectedProduct.value;
        if (selectedProduct == null) {
          return Center(child: Text("No product selected"));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // Total Savings Banner
                Container(
                  width: size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(color: color1, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Total Savings",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            "Hurray! You Get ₹50 Worth Clue Coins",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(width: size.width * 0.1),
                      Text(
                        '₹1000',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Product Summary
                Container(
                  width: size.width,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(selectedProduct.imagePath),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedProduct.productName,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 25,
                            width: size.width * 0.27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: color1, width: 1),
                            ),
                            child: Center(
                              child: Text(
                                'Till ${selectedProduct.examCategory}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: color2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "₹${selectedProduct.discountedPrice}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "₹${selectedProduct.actualPrice}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Use Coupons
                CustomContainer(
                  contentChild: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Extra 200% OFF',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Rs. 300 off on minimum purchase of Rs.1800',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        DottedBorder(
                          options: RectDottedBorderOptions(
                            padding: EdgeInsets.all(0),
                            color: color3,
                          ),
                          child: Container(
                            height: 40,
                            width: size.width * 0.4,
                            color: Colors.green.shade200,
                            child: Center(
                              child: Text(
                                "MemoNeetAchiever",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controller,
                          onFieldSubmitted: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Enter Coupon Code (Optional)',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomButtonTwo(
                          text: 'Apply',
                          width: size.width,
                          height: 50,
                          onTap: () {
                            productController.applyCoupon(
                              controller.text.trim(),
                            );
                            log('Button Tapped');
                            if (controller.text.trim() == 'MemoNeetAchiever') {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: Colors.white,
                                      content: SizedBox(
                                        width: size.width * 0.4,
                                        height: 240,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/icons/offer_icon.png',
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'MemoNeetAchiever Applied',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '₹ 300 off',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Saved! That feels amazing, right?',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              );
                            }
                            log(productController.discount.value.toString());
                          },
                        ),
                      ],
                    ),
                  ),
                  headerChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: color3, width: 2.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(Icons.percent, color: color3),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Use Coupons",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Bill details
                Obx(() {
                  final discount = productController.discount.value;
                  final igst = productController.igst();
                  final total = productController.total();
                  return CustomContainer(
                    contentChild: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 17,
                            vertical: 15,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Item total'),
                                  Text('₹ ${selectedProduct.discountedPrice}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Discounts',
                                    style: TextStyle(color: color3),
                                  ),
                                  Text(
                                    '₹ $discount',
                                    style: TextStyle(color: color3),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text('IGST (5%)'), Text('₹ $igst')],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          width: size.width,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TOTAL',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('₹ $total'),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    headerChild: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Text(
                        "Bill Details",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 30),

                // Pay button reactive
                Obx(() {
                  final disc = productController.discount.value;
                  return CustomButtonTwo(
                    width: size.width,
                    height: 50,
                    text: 'Pay',
                    onTap: () {
                      // log(disc.toString());
                      if (disc != 0.0) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PaymentSuccessfullScreen.route(),
                          (route) => false,
                        );
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PaymentFailureScreen.route(selectedProduct),
                          (route) => false,
                        );
                      }
                    },
                  );
                }),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }
}
