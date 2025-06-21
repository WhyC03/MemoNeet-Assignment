import 'package:flutter/material.dart';
import 'package:memoneet_assignment/theme.dart';

class CustomButtonOne extends StatelessWidget {
  final double width;
  final double height;
  const CustomButtonOne({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(color: color1, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Add Cart",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color1,
            ),
          ),
        ),
      ),
    );
  }
}
