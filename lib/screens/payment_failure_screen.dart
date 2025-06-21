import 'package:flutter/material.dart';
import 'package:memoneet_assignment/models/product_model.dart';
import 'package:memoneet_assignment/screens/payments_screen.dart';
import 'package:memoneet_assignment/widgets/custom_button_two.dart';

class PaymentFailureScreen extends StatelessWidget {
  final Product product;
  static route(Product product) =>
      MaterialPageRoute(builder: (context) => PaymentFailureScreen(product: product));
  const PaymentFailureScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset('assets/icons/payment_fail.png'),
              SizedBox(height: 10),
              Text(
                'Oh No!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Something Went Wrong',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.9,
                child: Text(
                  textAlign: TextAlign.center,
                  'All aboard! Your payment has been done. You receive a Confirmation Mail Shortly',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Need Help?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5),
              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomButtonTwo(
            text: 'Retry Payment',
            width: size.width * 0.9,
            height: 50,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                PaymentsScreen.route(product),
                (route) => false,
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
