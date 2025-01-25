
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CustomTextFormFieldTheme {
  CustomTextFormFieldTheme._();

  //Light TextFormField Theme -----------------------------

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.textGray,
    suffixIconColor: AppColors.textGray,
    labelStyle: const TextStyle().copyWith(fontSize: 16, color: AppColors.textGray, fontWeight: FontWeight.w500),
    hintStyle: const TextStyle().copyWith(fontSize: 16, color: AppColors.textGray, fontWeight: FontWeight.w500),
    errorStyle: const TextStyle().copyWith(fontSize: 16, color:AppColors.textGray, fontWeight: FontWeight.w500),
    floatingLabelStyle:  const TextStyle().copyWith(fontSize: 16, color: AppColors.textGray, fontWeight: FontWeight.w500),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: BorderSide(width: 1, color: AppColors.textGray),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: BorderSide(width: 1, color: AppColors.textGray),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: AppColors.textGray),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );

  //Dark TextFormField Theme -----------------------------

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkIcon,
    suffixIconColor: AppColors.darkIcon,
    labelStyle: const TextStyle().copyWith(fontSize: 16, color: AppColors.textDarkWhite, fontWeight: FontWeight.w500),
    hintStyle: const TextStyle().copyWith(fontSize: 16, color: AppColors.textDarkWhite, fontWeight: FontWeight.w500),
    errorStyle: const TextStyle().copyWith(
        fontSize: 16, color:AppColors.textDarkWhite, fontWeight: FontWeight.w500),
    floatingLabelStyle:  const TextStyle().copyWith(
        fontSize: 16, color: AppColors.textDarkWhite, fontWeight: FontWeight.w500),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: BorderSide(width: 1, color: AppColors.kPrimaryColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: BorderSide(width: 1, color: AppColors.kPrimaryColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: AppColors.kPrimaryColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );
}
