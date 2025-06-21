import 'package:flutter/material.dart';
import 'package:memoneet_assignment/theme.dart';

class PaymentsScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => PaymentsScreen());
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Icon(Icons.shopping_cart, color: color1),
          SizedBox(width: 5),
          Text("Share", style: TextStyle(fontSize: 18, color: color1)),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                border: Border.all(color: color1, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [Column(children: [])]),
            ),
          ],
        ),
      ),
    );
  }
}
