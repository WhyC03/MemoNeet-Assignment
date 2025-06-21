import 'package:flutter/material.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/widgets/custom_button_one.dart';

class ExtraProducts extends StatelessWidget {
  ExtraProducts({super.key});
  final List<Product> extraProducts = [
    Product(
      id: '1',
      productName: 'Biology Memes',
      actualPrice: 1000,
      discountedPrice: 500,
      discount: 50,
      productDetails: 'Complete physics material with solved examples.',
      purchased: true,
      imagePath: 'assets/images/biology_memes.png',
      examCategory: 'NEET 2024',
      tags: ['Biology'],
    ),
    Product(
      id: '2',
      productName: 'Biology Crossword',
      actualPrice: 1000,
      discountedPrice: 500,
      discount: 50,
      productDetails: 'Detailed biology notes for NEET 2025.',
      purchased: false,
      imagePath: 'assets/images/biology_crossword.png',
      examCategory: 'NEET 2025',
      tags: ['Biology', 'Notes'],
    ),
    // Add more products...
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.42,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: extraProducts.length, // Use filteredProducts
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.55,
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
                  SizedBox(height: 10),
                  SizedBox(
                    height: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.timer_outlined, color: Colors.red),
                        SizedBox(width: 5),
                        Text(
                          '23:59:00',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      extraProducts[index].imagePath,
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
                          extraProducts[index].productName,
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
                              "₹${extraProducts[index].discountedPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              "(${extraProducts[index].discount}% off)",
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
                          "₹${extraProducts[index].actualPrice}",
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
