import 'package:flutter/material.dart';
import 'package:my_aboutme/main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
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
              'Setting Page Detail',
              textScaleFactor: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
