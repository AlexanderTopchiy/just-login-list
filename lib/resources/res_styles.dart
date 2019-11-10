import 'package:flutter/material.dart';
import 'package:just_login_list/resources/res_strings.dart';

/// This class contains different styles and decorations
class ResStyles {
  // TEXT STYLES
  static TextStyle get screenTitle => TextStyle(
    color: Colors.white,
    fontSize: 34,
  );

  static TextStyle get btText => TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  static TextStyle get blackText => TextStyle(color: Colors.black);

  static TextStyle get ltTitle => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
  );

  // BOX DECORATIONS
  static BoxDecoration get loginCard => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: Offset(0, 10),
        blurRadius: 20,
      ),
    ],
  );

  // INPUT DECORATIONS
  static InputDecoration textInput(String label) => InputDecoration(
      border: UnderlineInputBorder(),
      labelText: label
  );
}