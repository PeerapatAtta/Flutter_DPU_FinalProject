import 'package:flutter/material.dart';
import 'package:my_aboutme/main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var leadingIcons = [
    Icons.star,
    Icons.favorite,
    Icons.wifi,
    Icons.bluetooth,
    Icons.settings,
  ];
  var titleText = [
    'Profile',
    'Languages',
    'Theme',
    'UI',
    'Help',
  ];
  var _switchTheme = true;
  var _switchUI = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        shape: Border(bottom: BorderSide(color: Colors.grey[400]!, width: 2)),
        backgroundColor: color2,
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        itemCount: titleText.length,
        itemBuilder: (context, index) => buildListItem(context, index),
        separatorBuilder: (context, i) => Divider(
          thickness: 1,
          color: Colors.blueGrey,
          indent: 10,
          endIndent: 10,
        ),
      ),
    );
  }

  Widget buildListItem(BuildContext ctx, int index) => ListTile(
        title: Text(
          titleText[index],
          textScaleFactor: 1.5,
        ),
        trailing: trailingWidget(ctx, index),
        onTap: () => alert(ctx, 'Open ${titleText[index]}'),
      );

  Widget trailingWidget(BuildContext ctx, int index) {
    var widgets = <Widget>[
      Icon(Icons.arrow_forward_ios),
      Icon(Icons.arrow_forward_ios),
      Switch(
        value: _switchTheme,
        onChanged: (isOn) => setState(() {
          _switchTheme = isOn;
          var t = (isOn) ? 'Light Mode' : 'Dark Mode';
          alert(ctx, '${titleText[index]} : $t');
        }),
        activeColor: color1,
      ),
      Switch(
        value: _switchUI,
        onChanged: (isOn) => setState(() {
          _switchUI = isOn;
          var t = (isOn) ? 'New Version' : 'Old School';
          alert(ctx, '${titleText[index]} : $t');
        }),
        activeColor: color1,
      ),
      Icon(Icons.arrow_forward_ios),
    ];
    return widgets[index];
  }

  void alert(BuildContext ctx, String msg) => showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
          content: Text(
            msg,
            textScaleFactor: 1.3,
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(
                  'OK',
                  textScaleFactor: 1.3,
                ))
          ],
        ),
      );
}
