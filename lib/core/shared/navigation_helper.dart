import 'package:flutter/material.dart';

class NavigationHelper {
  static void goto(BuildContext context , Widget routeName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeName,
      ),
    );
  }

    static void goOff(BuildContext context , Widget routeName) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => routeName,
      ),
    );
    }
     static void back(BuildContext context) {
      Navigator.pop(context);
  }
}