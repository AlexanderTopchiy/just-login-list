import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_login_list/screens/users_screen.dart';

/// This class represent UI of Login screen
class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _isPasswordNotEmpty = false;
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _isPasswordNotEmpty = _passwordController.value.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 233, 237, 1),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/bg_login.png', alignment: Alignment.topCenter),
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            top: 100,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Вход',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 45, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Email'
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Пароль'
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 30),
                        MaterialButton(
                          onPressed: () => _isPasswordNotEmpty ? _loginButtonCallback() : null,
                          color: Color.fromRGBO(155, 81, 224, 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minWidth: double.infinity,
                          height: 38,
                          child: Text(
                            'Войти',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loginButtonCallback() {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => UsersScreen()));
  }
}