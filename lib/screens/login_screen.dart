import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_login_list/resources/res_colors.dart';
import 'package:just_login_list/resources/res_images.dart';
import 'package:just_login_list/resources/res_strings.dart';
import 'package:just_login_list/resources/res_styles.dart';
import 'package:just_login_list/screens/users_screen.dart';

/// This class represent UI of Login screen
class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _isEmailNotEmpty = false;
  bool _isPasswordNotEmpty = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _isEmailNotEmpty = _emailController.value.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _isPasswordNotEmpty = _passwordController.value.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColors.bgLogin,
      body: GestureDetector(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(ResImages.bg_login, alignment: Alignment.topCenter),
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
                      ResStrings.enter,
                      style: ResStyles.screenTitle,
                    ),
                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 45, horizontal: 30),
                      decoration: ResStyles.loginCard,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _emailController,
                            decoration: ResStyles.textInput(ResStrings.email),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (focus) => FocusScope.of(context).requestFocus(_passwordFocusNode),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            decoration: ResStyles.textInput(ResStrings.password),
                            obscureText: true,
                          ),
                          SizedBox(height: 30),
                          MaterialButton(
                            onPressed: () => _isEmailNotEmpty & _isPasswordNotEmpty
                                                ? _loginButtonCallback()
                                                : null,
                            color: _isEmailNotEmpty & _isPasswordNotEmpty
                                      ? ResColors.accessed
                                      : ResColors.notAccessed,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minWidth: double.infinity,
                            height: 38,
                            child: Text(
                              ResStrings.toComeIn,
                              style: ResStyles.btText,
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
        onTap: () => FocusScope.of(context).unfocus(),
      ),
    );
  }

  void _loginButtonCallback() {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => UsersScreen()));
  }
}