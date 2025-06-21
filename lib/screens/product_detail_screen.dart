import 'package:flutter/material.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/screens/payments_screen.dart';
import 'package:memoneet_assignment/theme.dart';
import 'package:memoneet_assignment/widgets/custom_button_one.dart';
import 'package:memoneet_assignment/widgets/custom_button_two.dart';
import 'package:memoneet_assignment/widgets/extra_products.dart';
import 'package:memoneet_assignment/widgets/recommended_products.dart';

class ProductDetailScreen extends StatelessWidget {
  static route(Product product) => MaterialPageRoute(
    builder: (context) => ProductDetailScreen(product: product),
  );
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          // Product Image
                          SizedBox(
                            width: 220,
                            height: 220,
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (product.purchased)
                      Image.asset('assets/icons/Purchased_Tag.png'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: color1, width: 1),
                          ),
                          child: Center(
                            child: Text(
                              'Till ${product.examCategory}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: color2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.productName,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Icon(Icons.share_outlined, size: 25),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "₹${product.discountedPrice}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(width: 25),
                        Text(
                          "₹${product.actualPrice}",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 25),
                        Text(
                          "(${product.discount}% off)",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomButtonOne(width: size.width, height: 50),
                    SizedBox(height: 10),
                    CustomButtonTwo(
                      text: 'Buy Now',
                      width: size.width,
                      height: 50,
                      onTap: () {
                        Navigator.push(context, PaymentsScreen.route(product));
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 2,
                      width: size.width,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/percent.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Limited Time Offer for you",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Add Two or More Books to Cart, Get 8% Discount",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined, size: 28),
                      ],
                    ),
                    SizedBox(height: 20),
                    ExtraProducts(),
                    Container(
                      height: 2,
                      width: size.width,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 20),
                    // Product Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined, size: 30),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      product.productDetails,
                      maxLines: 12,
                      style: TextStyle(fontSize: 17),
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 2,
                      width: size.width,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 20),
                    // Recommended Products
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommendation',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_outlined, size: 25),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    RecommendedProducts(),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
