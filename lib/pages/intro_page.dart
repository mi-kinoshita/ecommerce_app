import 'package:ecommerce_app/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO
            Lottie.asset("assets/cart_anime.json"),

            Text("MY ARTIST",
                style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, fontSize: 32)),

            const SizedBox(
              height: 5,
            ),

            Text(
              "Premium Quality Services",
                style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),


            const SizedBox(
              height: 35,
            ),

            MyButton(
              onTap: () {
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  print(user);
                  Navigator.pushNamed(context, "/top_page");
                } else {
                  Navigator.pushNamed(context, "/login_page");
                }
                // Navigator.pushNamed(context, "/top_page");
              },
              child: const Text("Enter"),
            )
          ],
        ),
      ),
    );
  }
}
