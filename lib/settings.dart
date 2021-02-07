import 'package:flutter/material.dart';
import 'package:productivity_timer/widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          Text("Work", style: TextStyle(fontSize: 20.0)),
          Text(""),
          Text(""),
          SettingsButton(color: Color(0xFF455A64), text: "-", value: 1),
          TextField(style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center, keyboardType: TextInputType.number),
          SettingsButton(color: Color(0xFF009688), text: "+", value: 1),
          Text("Short", style: TextStyle(fontSize: 20.0)),
          Text(""),
          Text(""),
          SettingsButton(color: Color(0xFF455A64), text: "-", value: 1),
          TextField(style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center, keyboardType: TextInputType.number),
          SettingsButton(color: Color(0xFF009688), text: "+", value: 1),
          Text("Long", style: TextStyle(fontSize: 20.0)),
          Text(""),
          Text(""),
          SettingsButton(color: Color(0xFF455A64), text: "-", value: 1),
          TextField(style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center, keyboardType: TextInputType.number),
          SettingsButton(color: Color(0xFF009688), text: "+", value: 1),
        ],
        padding: const EdgeInsets.all(20.0),
      ),
    );
  }
}
