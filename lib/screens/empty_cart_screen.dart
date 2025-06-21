import 'package:flutter/material.dart';
import 'package:memoneet_assignment/screens/home_screen.dart';
import 'package:memoneet_assignment/widgets/custom_button_two.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

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
              Image.asset('assets/icons/shopping_cart.png'),
              SizedBox(height: 10),
              Text(
                'Empty Cart!',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: Text(
                  textAlign: TextAlign.center,
                  'Looks like you haven’t made your choice yet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 30),
              CustomButtonTwo(
                text: 'Browse Store',
                width: size.width,
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
        ),
      ),
    );
  }
}
