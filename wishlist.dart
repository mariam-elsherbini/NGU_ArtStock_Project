import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  final Color backgroundColor = Color(0xFFEDE4FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Your Wishlist"),
        backgroundColor: Colors.purple[300],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Wishlist is empty',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
