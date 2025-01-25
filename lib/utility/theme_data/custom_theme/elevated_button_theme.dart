
import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class CustomElevatedButtonTheme{
  CustomElevatedButtonTheme._();

  //Light Elevated Button Theme -----------------------------

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kPrimaryColor,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        // side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontSize: 20,color: Colors.white , fontWeight:FontWeight.w600 ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))

    ),
  );

  //Dark Elevated Button Theme -----------------------------

  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kPrimaryColor,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontSize: 20,color: Colors.white , fontWeight:FontWeight.w500 ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))

    ),
  );
}