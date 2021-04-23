import 'package:flutter/material.dart';
import 'package:flash_chat/constant.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final String text;

  RoundedButton(
      {@required this.color, @required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(25),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: k_loginbutton_TextStyle_welcomescrn,
          ),
        ),
      ),
    );
  }
}
