import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  Color color;
  BlueButton(this.text,{required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(this.color));
    return Container(
        padding: const EdgeInsets.all(10),
        //elevatedButton é a forma mais nova de usar o RaisedButton
        child:  ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Text(text),
        ),
    );
  }
}
