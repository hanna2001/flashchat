import 'package:flash_chat/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constant.dart';
import 'login_screen.dart';
import 'package:flash_chat/components/CustomButton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController c;
  Animation a;
  @override
  void initState() {
    super.initState();
    c = AnimationController(duration: Duration(seconds: 1), vsync: this);
    a = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(c);
    c.forward();
    c.addListener(() {
      setState(() {});
      //print(a.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: a.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60,
                    child: Image(
                      image: AssetImage('images/logo.png'),
                    ),
                  ),
                ),
                ColorizeAnimatedTextKit(
                  colors: [
                    Colors.black,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  textAlign: TextAlign.start,
                  //duration: Duration(milliseconds: 1),
                  speed: Duration(milliseconds: 150),
                  text: ['Flash Chat'],
                  textStyle: k_heading_TextStyle_welcomescrn,
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          RoundedButton(
              color: kLoginPgClr,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              text: 'Login'),
          RoundedButton(
            color: kRegPgClr,
            onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
            text: 'Register',
          )
        ],
      ),
    );
  }
}
