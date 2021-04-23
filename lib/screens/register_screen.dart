import 'package:flash_chat/constant.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/CustomButton.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'reg_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
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
                  hintStyle: k_HintTextStyle_regscrn,
                  hintText: 'Enter your email',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        kCustomTFBorder.copyWith(color: kRegPgClr, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        kCustomTFBorder.copyWith(color: kRegPgClr, width: 2),
                  ),
                ),
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
                  hintStyle: k_HintTextStyle_regscrn,
                  hintText: 'Enter Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        kCustomTFBorder.copyWith(color: kRegPgClr, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        kCustomTFBorder.copyWith(color: kRegPgClr, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  //Navigator.pushNamed(context, ChatScreen.id);
                  // print(password);
                  // print(username);
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: username, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
                text: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
