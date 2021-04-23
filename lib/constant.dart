import 'package:flutter/material.dart';

const kLoginPgClr = Colors.lightBlueAccent;
const kRegPgClr = Colors.blueAccent;

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const k_heading_TextStyle_welcomescrn =
    TextStyle(fontSize: 50, fontWeight: FontWeight.w700, color: Colors.black);
const k_loginbutton_TextStyle_welcomescrn =
    TextStyle(fontSize: 20, color: Colors.white);

const k_HintTextStyle_regscrn = TextStyle(fontSize: 17, color: kRegPgClr);

const kSendButtonTextStyle = TextStyle(
  color: kLoginPgClr,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kLoginPgClr, width: 2.0),
  ),
);

const kCustomTFBorder = BorderSide(color: kRegPgClr, width: 1.0);

const kTextInpDec = InputDecoration(
  hintStyle: k_HintTextStyle_regscrn,
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
);

const kmsgBubbleRadiusMe = BorderRadius.only(
  topLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
  bottomLeft: Radius.circular(30),
);

const kmsgBubbleRadius = BorderRadius.only(
  topRight: Radius.circular(30),
  bottomRight: Radius.circular(30),
  bottomLeft: Radius.circular(30),
);

// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: color, width: 1.0),
// borderRadius: BorderRadius.all(Radius.circular(32.0)),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: color, width: 2.0),
// borderRadius: BorderRadius.all(Radius.circular(32.0)),
// ),
