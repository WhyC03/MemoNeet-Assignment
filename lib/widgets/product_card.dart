import 'package:flutter/material.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/widgets/custom_button_one.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    product.imagePath,
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
                        product.productName,
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
                            "₹${product.discountedPrice}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            "(${product.discount}% off)",
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
                        "₹${product.actualPrice}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(height: 10),
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Center(
                      //     child: Container(
                      //       height: 40,
                      //       width: 120,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         border: Border.all(color: color1, width: 2),
                      //       ),
                      //       child: Center(
                      //         child: Text(
                      //           'Add Cart',
                      //           style: TextStyle(
                      //             fontSize: 17,
                      //             fontWeight: FontWeight.bold,
                      //             color: color1,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      CustomButtonOne(width: 120, height: 40)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        if (product.purchased)
          Image.asset('assets/icons/Purchased_Tag.png', width: 80),

        // Purchased banner (top-left)
        // if (product.purchased)
        //   Positioned(
        //     top: 20,
        //     left: -10,
        //     child: Transform.rotate(
        //       angle: -0.7,
        //       child: ClipPath(
        //         clipper: TrapeziumClipper(),
        //         child: Container(
        //           width: 90,
        //           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //           decoration: BoxDecoration(color: Colors.grey[400]),
        //           child: Center(
        //             child: Text(
        //               'Purchased',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 11,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}

// class TrapeziumClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(10, 0);
//     path.lineTo(size.width - 10, 0);
//     path.lineTo(size.width + 20, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(-20, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
