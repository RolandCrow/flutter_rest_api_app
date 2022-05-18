



import 'package:flutter/material.dart';

class EvgenButton extends StatelessWidget {

  final Function onPressed;
  final String text;

  EvgenButton({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      padding: EdgeInsets.all(8),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 18)),
      color: Colors.black,
      textColor: Colors.white,
      splashColor: Colors.orange,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white70,
    );
  }
}