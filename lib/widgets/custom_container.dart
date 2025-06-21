import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget contentChild;
  final Widget headerChild;
  const CustomContainer({
    super.key,
    required this.contentChild,
    required this.headerChild,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: size.width,
            height: 50,
            color: Colors.grey.shade300,
            child: headerChild,
          ),
          Container(child: contentChild),
        ],
      ),
    );
  }
}
