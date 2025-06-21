import 'package:memoneet_assignment/models/product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  int get totalPrice => product.discountedPrice * quantity;
}
