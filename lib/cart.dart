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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: color1,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: 2,
        items: bottomNavItems(),
        onTap: (index) => (),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavItems() {
    var itemIcons = [
      Icons.home,
      Icons.coffee,
      Icons.shopping_cart,
      Icons.menu,
    ];
    var itemLabels = [
      'Home',
      'Menu',
      'Cart',
      'Setting',
    ];

    return List.generate(
        itemIcons.length,
        (index) => BottomNavigationBarItem(
              icon: Icon(itemIcons[index]),
              label: itemLabels[index],
            ));
  }
}
