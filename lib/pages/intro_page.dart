import 'package:ecommerce_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO
            Lottie.asset("assets/cart_anime.json"),

            Text("SHOP FOR YOU",
                style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, fontSize: 32)),

            const SizedBox(
              height: 5,
            ),

            Text(
              "Premium Quality Products",
                style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),


            const SizedBox(
              height: 35,
            ),

            MyButton(
              onTap: () => Navigator.pushNamed(context, "/shop_page"),
              child: Text("Enter",)
            )
          ],
        ),
      ),
    );
  }
}
