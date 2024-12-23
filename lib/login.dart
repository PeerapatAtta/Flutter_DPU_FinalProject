import 'package:flutter/material.dart';
import 'package:my_aboutme/homePage.dart';
import 'package:my_aboutme/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late String msg = "";

  Future<dynamic> signIn() async {
    if (usernameController.text == '' || passwordController.text == '') {
      setState(() {
        msg = 'User or Password are incorrect.';
      });
    }

    if (usernameController.text == 'off' && passwordController.text == '1234') {
      setPreferences(1);
    } else {
      setState(() {
        msg = 'User or Password are incorrect.';
      });
    }
  }

  void setPreferences(res) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("userauthen", res);
    //if (!context.mounted) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 200,
                    height: 200,
                  )),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  'Good Day Coffee'),
              SizedBox(
                height: 25,
              ),
              if (msg != "")
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    msg,
                    style: TextStyle(color: Colors.red[800]),
                  ),
                ),
              // Username Text Filed
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "User Name",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.key),
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    onPressed: signIn,
                    style: ElevatedButton.styleFrom(backgroundColor: color1),
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ))),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
