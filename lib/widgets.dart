import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;

  ProductivityButton({@required this.color, @required this.text, @required this.onPressed, @required this.size});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: this.onPressed,
      minWidth: this.size,
      color: this.color,
    );
  }
}

class SettingsButton extends StatelessWidget {
  final Color color;
  final String text;
  final int value;

  SettingsButton({this.color, this.text, this.value});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white, fontSize: 25.0),
      ),
      color: this.color,
      onPressed: () => null,
    );
  }
}
