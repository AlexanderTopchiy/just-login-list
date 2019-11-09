import 'package:flutter/material.dart';

/// This class represent UI of Login screen
class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 233, 237, 1),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/bg_login.png',
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}