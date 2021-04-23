import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constant.dart';
import 'package:flash_chat/components/CustomButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpin = false;
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpin,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 150.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  username = value;
                },
                decoration: kTextInpDec.copyWith(
                    hintStyle: k_HintTextStyle_regscrn.copyWith(
                      color: kLoginPgClr,
                    ),
                    hintText: 'Enter your email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: kCustomTFBorder.copyWith(color: kLoginPgClr),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: kCustomTFBorder.copyWith(
                      color: kLoginPgClr,
                      width: 2,
                    ))),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: '*',
                onChanged: (String value) {
                  password = value;
                },
                decoration: kTextInpDec.copyWith(
                  hintStyle: k_HintTextStyle_regscrn.copyWith(
                    color: kLoginPgClr,
                  ),
                  hintText: 'Enter Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        kCustomTFBorder.copyWith(color: kLoginPgClr, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        kCustomTFBorder.copyWith(color: kLoginPgClr, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Flexible(
                child: RoundedButton(
                  color: kLoginPgClr,
                  onPressed: () async {
                    setState(() {
                      showSpin = true;
                    });
                    //Navigator.pushNamed(context, ChatScreen.id);
                    // print(password);
                    // print(username);
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: username, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpin = false;
                      });
                    } catch (e) {
                      print(e);
                      setState(() {
                        showSpin = false;
                      });
                    }
                  },
                  text: 'Login',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
