import 'package:flutter/material.dart';
import 'package:memoneet_assignment/screens/home_screen.dart';
import 'package:memoneet_assignment/theme.dart';
import 'package:memoneet_assignment/widgets/custom_button_two.dart';

class PaymentSuccessfullScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => PaymentSuccessfullScreen());
  const PaymentSuccessfullScreen({super.key});

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
              Image.asset('assets/icons/payment_successful.png'),
              SizedBox(height: 10),
              Text(
                'Payment Successful!',
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                HomeScreen.route(),
                (route) => false,
              );
            },
            child: Container(
              height: 50,
              width: size.width * 0.35,
              decoration: BoxDecoration(
                border: Border.all(color: color1, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "HOME",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color1,
                  ),
                ),
              ),
            ),
          ),
          CustomButtonTwo(
            text: 'EXPLORE SHOP',
            width: size.width * 0.6,
            height: 50,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                HomeScreen.route(),
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
