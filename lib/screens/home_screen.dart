import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/screens/product_detail_screen.dart';
import 'package:memoneet_assignment/services/api_service.dart';
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
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final result = await ApiService.fetchProducts();
      setState(() => products = result);
    } catch (e) {
      log("Failed to load products: $e");
    }
  }

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
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: (filteredProducts.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        int first = index * 2;
                        int second = first + 1;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ProductCard(
                                  product: filteredProducts[first],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      ProductDetailScreen.route(filteredProducts[first]),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              if (second < filteredProducts.length)
                                Expanded(
                                  child: ProductCard(
                                    product: filteredProducts[second],
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        ProductDetailScreen.route(filteredProducts[second]),
                                      );
                                    },
                                  ),
                                )
                              else
                                Expanded(child: SizedBox()), // Empty space if odd number
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 150),
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
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Icon(item['icon'], size: 35),
                          Text(
                            item['label'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
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
