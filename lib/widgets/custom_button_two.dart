import 'package:flutter/material.dart';
import 'package:memoneet_assignment/theme.dart';

class CustomButtonTwo extends StatelessWidget {
  final String text;
  final double width;
  const CustomButtonTwo({super.key, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: size.width,
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
