import 'package:flutter/material.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/screens/product_detail_screen.dart';
import 'package:memoneet_assignment/theme.dart';
import 'package:memoneet_assignment/widgets/banner_carousel.dart';
import 'package:memoneet_assignment/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeScreen());
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int selectedChipIndex = -1; // -1 means none selected
  final List<String> chipLabels = ['Biology', 'Chemistry', 'Physics', 'Notes'];
  final List<String> categories = ['NEET 2024', 'NEET 2025'];

  final List<Map<String, dynamic>> iconItems = [
    {'icon': Icons.home_outlined, 'label': 'Home'},
    {'icon': Icons.shopping_cart_outlined, 'label': 'Store'},
    {'icon': Icons.checklist_rtl, 'label': 'Test'},
    {'icon': Icons.settings_outlined, 'label': 'Settings'},
  ];

  String selectedCategory = '';

  final List<Product> products = [
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
    List<Product> filteredProducts =
        selectedChipIndex == -1
            ? products
            : products
                .where(
                  (product) =>
                      product.tags.contains(chipLabels[selectedChipIndex]),
                )
                .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Store",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          // Shopping Cart
          InkWell(
            child: Image.asset('assets/icons/bag.png', width: 30),
            onTap: () {},
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(categories.length, (index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? color1 : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 10),
            BannerCarousel(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.75,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Search Products',
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            focusColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/icons/Filter Buttons.png',
                          // width: 55,
                          // height: 65,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          chipLabels
                              .asMap()
                              .entries
                              .map(
                                (entry) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (selectedChipIndex == entry.key) {
                                          selectedChipIndex =
                                              -1; // Deselect if already selected
                                        } else {
                                          selectedChipIndex =
                                              entry.key; // Select new chip
                                        }
                                      });
                                    },
                                    child: Chip(
                                      color:
                                          selectedChipIndex == entry.key
                                              ? WidgetStatePropertyAll(
                                                Colors.blue[100],
                                              )
                                              : WidgetStatePropertyAll(
                                                Colors.white,
                                              ),
                                      label: Text(
                                        entry.value,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      side: BorderSide(color: color1, width: 2),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: size.height * 0.5,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          filteredProducts.length, // Use filteredProducts
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: filteredProducts[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              ProductDetailScreen.route(
                                filteredProducts[index],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: size.width,
        height: 80,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: size.width, height: 1, color: Colors.black),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  iconItems.map((item) {
                    return Column(
                      children: [
                        Icon(item['icon'], size: 35),
                        // SizedBox(height: 4),
                        Text(
                          item['label'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
