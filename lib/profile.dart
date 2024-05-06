import 'package:flutter/material.dart';
import 'package:my_aboutme/main.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          shape: Border(bottom: BorderSide(color: Colors.grey[400]!, width: 2)),
          backgroundColor: color2,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Image(
                    image: AssetImage('assets/images/tiger.png'),
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Good Day Coffee Team',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text(
                      'WE679',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        'Special Topics in Technology of Mobile Application Development'),
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text(
                      'Member',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        '66130151 Peerapat Atta\n66130413 Sorasak Charoenkittisak'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
