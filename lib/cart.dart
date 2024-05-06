import 'package:flutter/material.dart';
import 'package:my_aboutme/main.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        shape: Border(bottom: BorderSide(color: Colors.grey[400]!, width: 2)),
        backgroundColor: color2,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Cart Page Detail',
              textScaleFactor: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
