import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/screens/empty_cart_screen.dart';
import 'package:memoneet_assignment/screens/payment_failure_screen.dart';
import 'package:memoneet_assignment/screens/payment_successfull_screen.dart';
import 'package:memoneet_assignment/screens/product_detail_screen.dart';
import 'package:memoneet_assignment/theme.dart';
import 'package:memoneet_assignment/widgets/custom_button_two.dart';
import 'package:memoneet_assignment/widgets/custom_container.dart';

class PaymentsScreen extends StatefulWidget {
  static route(Product product) =>
      MaterialPageRoute(builder: (context) => PaymentsScreen(product: product));
  final Product product;
  const PaymentsScreen({super.key, required this.product});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  double discount = 0.0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController controller = TextEditingController();
    double igst = (widget.product.discountedPrice) * 0.05;
    double total = (widget.product.discountedPrice) + igst - discount;

    // double progress = 0.35;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              ProductDetailScreen.route(widget.product),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Your Total Savings
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              // Product Container
              Container(
                width: size.width,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(widget.product.imagePath),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.productName,
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
                              'Till ${widget.product.examCategory}',
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "₹${widget.product.discountedPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "₹${widget.product.actualPrice}",
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
              // Unlock New Offer
              // CustomContainer(
              //   contentChild: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Icon(Icons.lock, color: color4, size: 25),
              //             SizedBox(width: 5),
              //             Text(
              //               "Shop for 4000 more to unlock special price",
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w700,
              //                 fontSize: 15,
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 10),
              //         LinearProgressIndicator(
              //           value: progress, // value between 0.0 and 1.0
              //           minHeight: 5,
              //           color: color4,
              //           backgroundColor: Colors.grey[300],
              //         ),
              //         SizedBox(height: 10),
              //         Row(children: []),
              //         SizedBox(height: 10),
              //         Row(children: []),
              //       ],
              //     ),
              //   ),
              //   headerChild: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 10),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Container(
              //           decoration: BoxDecoration(
              //             border: Border.all(color: color1, width: 2.5),
              //             borderRadius: BorderRadius.circular(50),
              //           ),
              //           child: Icon(Icons.percent, color: color1),
              //         ),
              //         SizedBox(width: 10),
              //         Text(
              //           "Unlock New Offer",
              //           style: TextStyle(
              //             fontWeight: FontWeight.w900,
              //             fontSize: 18,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20),
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
                          decoration: BoxDecoration(
                            color: Colors.green.shade200,
                          ),
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
                        onFieldSubmitted: (newValue) {
                          newValue = controller.text.trim();
                          if (newValue == 'MemoNeetAchiever') {
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
                            setState(() {
                              discount = 300.0;
                            });
                          }
                        },
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
                    ],
                  ),
                ),
                headerChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
              // Bill Details
              CustomContainer(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Item total',
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                '₹  ${widget.product.discountedPrice}',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discounts',
                                style: TextStyle(fontSize: 17, color: color3),
                              ),
                              Text(
                                '₹  $discount',
                                style: TextStyle(fontSize: 17, color: color3),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('IGST (5%)', style: TextStyle(fontSize: 17)),
                              Text('₹  $igst', style: TextStyle(fontSize: 17)),
                            ],
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
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('₹  $total', style: TextStyle(fontSize: 17)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                headerChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Bill Details",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              CustomButtonTwo(
                width: size.width,
                height: 50,
                text: 'Pay',
                onTap: () {
                  if (discount != 0.0) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PaymentSuccessfullScreen.route(),
                      (route) => false,
                    );
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PaymentFailureScreen.route(widget.product),
                      (route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
