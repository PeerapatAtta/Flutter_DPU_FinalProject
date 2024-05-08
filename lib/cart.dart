import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        child: Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.topCenter,
          child: ListView.separated(
            itemCount: 3,
            itemBuilder: (ctx, i) => buildListTile(i),
            separatorBuilder: (ctx, i) => Divider(
              thickness: 1,
              color: Colors.indigo,
            ),
          ),
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

  var cartItems = [
    'Iced Matcha Latte',
    'Coffee White Russian',
    'Hot Chocolate'
  ];

  Widget buildListTile(int index) => ListTile(
        contentPadding: EdgeInsets.only(top: 5, bottom: 5),
        leading: Icon(Icons.coffee_maker),
        title: Text(cartItems[index]),
        trailing: rowQuantity(index),
      );

  Widget rowQuantity(int index) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
              style: btnStyle(),
              onPressed: () => (),
              child: Text(
                '+',
                textScaleFactor: 1.3,
              )),
          Text(
            '  1  ',
            textScaleFactor: 1.4,
          ),
          OutlinedButton(
              style: btnStyle(),
              onPressed: () => (),
              child: Text(
                '-',
                textScaleFactor: 1.3,
              )),
        ],
      );

  ButtonStyle btnStyle() => OutlinedButton.styleFrom(
        minimumSize: Size(30, 30),
        side: BorderSide(
            color: Colors.black26, width: 1.2, style: BorderStyle.solid),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

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
