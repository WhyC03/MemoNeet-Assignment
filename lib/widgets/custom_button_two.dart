import 'package:flutter/material.dart';
import 'package:memoneet_assignment/theme.dart';

class CustomButtonTwo extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onTap;
  const CustomButtonTwo({super.key, required this.text, required this.width, required this.height, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
