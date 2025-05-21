import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final Color backgroundColor = Color(0xFFEDE4FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Colors.purple[300],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Cart is empty',
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
