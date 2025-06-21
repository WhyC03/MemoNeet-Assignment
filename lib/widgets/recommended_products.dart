import 'package:flutter/material.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/widgets/custom_button_one.dart';

class RecommendedProducts extends StatelessWidget {
  RecommendedProducts({super.key});

  final List<Product> recommendedProducts = [
    Product(
      id: '1',
      productName: 'Physics Notes',
      actualPrice: 1200,
      discountedPrice: 899,
      discount: 25,
      productDetails:
          'What Sets This Book Apart? \nColorful Mindmaps: Visualize intricate concepts and formulas effortlessly through mind maps, enhancing your comprehension and retention. Complete Coverage: Covering every chapter of Physics, Chemistry, and Biology, this book ensures you have a solid grasp of all topics required for the NEET exam. \nEmphasized Important Topics: Focused on the most crucial areas for NEET, the book highlights the topics that carry the highest relevance and weightage. \nBook Description: "MIND MAPS FOR NEET" is your ultimate study companion designed to help you conquer the NEET exam with confidence. Through the innovative approach of colorful mind maps, this book transforms complex concepts into easy-to-understand visual aids. \nIt comprehensively covers all chapters of Physics, Chemistry, and Biology, adhering strictly to the latest NEET exam syllabus. Moreover, it strategically emphasizes the most important topics, ensuring that your preparation is targeted and effective. \n\nWhat Will You Learn? \nEnhance learning and memory retention by the usage of colorful Mindmaps in visualizing and comprehending complex ideas & formulas. \nComprehensive coverage of all subjects ensures a strong foundation, enabling aspirants to tackle the NEET syllabus more confidently. A thorough understanding of these basics is essential for solving advanced problems. Stay aligned with the latest NEET exam syllabus, making your preparation relevant and up-to-date. \nFocus your efforts on the most significant topics as earmarked for the NEET exam, boosting your chances of success.',
      purchased: true,
      imagePath: 'assets/images/Physics_notes.png',
      examCategory: 'NEET 2024',
      tags: ['Physics', 'Notes'],
    ),
    Product(
      id: '2',
      productName: 'Biology Notes',
      actualPrice: 1000,
      discountedPrice: 750,
      discount: 25,
      productDetails:
          'What Sets This Book Apart? \nColorful Mindmaps: Visualize intricate concepts and formulas effortlessly through mind maps, enhancing your comprehension and retention. Complete Coverage: Covering every chapter of Physics, Chemistry, and Biology, this book ensures you have a solid grasp of all topics required for the NEET exam. \nEmphasized Important Topics: Focused on the most crucial areas for NEET, the book highlights the topics that carry the highest relevance and weightage. \nBook Description: "MIND MAPS FOR NEET" is your ultimate study companion designed to help you conquer the NEET exam with confidence. Through the innovative approach of colorful mind maps, this book transforms complex concepts into easy-to-understand visual aids. \nIt comprehensively covers all chapters of Physics, Chemistry, and Biology, adhering strictly to the latest NEET exam syllabus. Moreover, it strategically emphasizes the most important topics, ensuring that your preparation is targeted and effective. \n\nWhat Will You Learn? \nEnhance learning and memory retention by the usage of colorful Mindmaps in visualizing and comprehending complex ideas & formulas. \nComprehensive coverage of all subjects ensures a strong foundation, enabling aspirants to tackle the NEET syllabus more confidently. A thorough understanding of these basics is essential for solving advanced problems. Stay aligned with the latest NEET exam syllabus, making your preparation relevant and up-to-date. \nFocus your efforts on the most significant topics as earmarked for the NEET exam, boosting your chances of success.',
      purchased: false,
      imagePath: 'assets/images/Biology_notes.png',
      examCategory: 'NEET 2025',
      tags: ['Biology', 'Notes'],
    ),
    // Add more products...
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: recommendedProducts.length, // Use filteredProducts
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
