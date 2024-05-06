import 'package:flutter/material.dart';
import 'package:my_aboutme/login.dart';
import 'package:my_aboutme/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color2,
        title: Text('Home Page'),
        automaticallyImplyLeading: false,
        shape: Border(bottom: BorderSide(color: Colors.grey[400]!, width: 2)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Welcome to Good Day Coffee'),
                    subtitle: Text('WE679'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: Icon(Icons.logout),
                        onPressed: () => {
                          logOut(),
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()))
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    color: color2,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'profile');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/man.png'),
                                height: 80,
                                width: 80),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    color: color2,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'product');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/coffee.png'),
                                height: 80,
                                width: 80),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'Menu',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    color: color2,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'cart');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/cart.png'),
                                height: 80,
                                width: 80),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'Cart',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    color: color2,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'setting');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/gear.png'),
                                height: 80,
                                width: 80),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'Setting',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
