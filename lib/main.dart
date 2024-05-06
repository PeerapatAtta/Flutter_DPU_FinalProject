import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_aboutme/cart.dart';
import 'package:my_aboutme/homePage.dart';
import 'package:my_aboutme/login.dart';
import 'package:my_aboutme/product_list.dart';
import 'package:my_aboutme/profile.dart';
import 'package:my_aboutme/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

Color color1 = const Color.fromARGB(255, 29, 117, 32);
Color color2 = Color.fromARGB(255, 119, 179, 122);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'My About me'),
      routes: <String, WidgetBuilder>{
        'profile': (BuildContext context) => Profile(),
        'product': (BuildContext context) => ProductList(),
        'cart': (BuildContext context) => CartPage(),
        'setting': (BuildContext context) => SettingPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int userId = 0;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userid = prefs.getInt('userauthen')!;
    setState(() {
      userId = userid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        builder: (context, snapshot) {
          if (userId >= 1) {
            return HomePage();
          } else {
            return Login();
          }
        },
        future: null,
      ),
    );
  }
}
