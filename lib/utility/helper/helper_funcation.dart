import 'package:flutter/material.dart';

class HelperFunctions {
  static isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
