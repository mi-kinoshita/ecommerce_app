import 'package:flutter/material.dart';

class MyShopTile extends StatelessWidget {
  const MyShopTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/shop_page',
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(10),
        width: 250,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            alignment: Alignment.topRight,
            image: const AssetImage('assets/dramatic_lighting.jpeg'),
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.srcATop,
            ),
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Freelance hairdresser',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}