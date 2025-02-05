import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';


class CustomOutlineButtonTheme{
  CustomOutlineButtonTheme._();

  //Light OutlineButton Theme -----------------------------

  static OutlinedButtonThemeData lightOutlineButtonTheme = OutlinedButtonThemeData(

    style:OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.textPrimary,
      side:  const BorderSide(color:AppColors.kPrimaryColor),
      textStyle: const TextStyle(fontSize: 20,color: AppColors.kPrimaryColor , fontWeight:FontWeight.w500 ),
      padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.borderRadiusXl))
    ),
  );

  //Dark OutlineButton Theme -----------------------------

  static OutlinedButtonThemeData darkOutlineButtonTheme = OutlinedButtonThemeData(

    style:  OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.textPrimary,
      side: const BorderSide(color: AppColors.kPrimaryColor),
      textStyle: const TextStyle(fontSize: 20,color: AppColors.kPrimaryColor , fontWeight:FontWeight.w500 ),
      padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.borderRadiusXl))
    ),
  );
}