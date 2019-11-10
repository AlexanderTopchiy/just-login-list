import 'package:flutter/material.dart';
import 'package:just_login_list/screens/login_screen.dart';

void main() => runApp(JustApp());

class JustApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}