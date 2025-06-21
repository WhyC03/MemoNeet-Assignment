import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/services/api_service.dart';
import 'package:memoneet_assignment/widgets/custom_button_one.dart';

class RecommendedProducts extends StatefulWidget {
  const RecommendedProducts({super.key});

  @override
  State<RecommendedProducts> createState() => _RecommendedProductsState();
}

class _RecommendedProductsState extends State<RecommendedProducts> {
  List<Product> recommendedProducts = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final result = await ApiService.fetchProducts();
      setState(() => recommendedProducts = result);
    } catch (e) {
      log("Failed to load recommendedProducts: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount:
            recommendedProducts.length >= 2
                ? 2
                : recommendedProducts.length, // Use filteredProducts
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 220,
              height: 700,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      recommendedProducts[index].imagePath,
                      height: 120,
                      width: double.infinity,
                      // fit: BoxFit.cover,
                    ),
                  ),

                  // Product Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          recommendedProducts[index].productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              "₹${recommendedProducts[index].discountedPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              "(${recommendedProducts[index].discount}% off)",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),

                        Text(
                          "₹${recommendedProducts[index].actualPrice}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(height: 10),

                        Center(child: CustomButtonOne(width: 140, height: 50)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
