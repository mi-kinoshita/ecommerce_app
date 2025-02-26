import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const MyListTile({super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey[700],
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.grey[700]),
        ),
        onTap: onTap,
      ),
    );
  }
}
