import 'package:evently/utility/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Inter',
        color: AppColors.textWhite),
    titleMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'Inter',
        color: AppColors.kPrimaryColor),

    headlineLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Inter',
        color: AppColors.textPrimary),
    headlineMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: 'Inter',
        color: AppColors.textPrimary),
    headlineSmall: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        fontFamily: 'Inter',
        color: AppColors.textPrimary),

    bodyLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: 'Inter',
        color: AppColors.textWhite),
    bodyMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize:16,
        fontFamily: 'Inter',
        color: AppColors.textBlack),
    bodySmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        fontFamily: 'Inter',
        color: AppColors.textBlack),

    labelSmall: const TextStyle().copyWith(
        color: AppColors.textWhite,
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w400),
    labelMedium: const TextStyle().copyWith(
        color: AppColors.textWhite,
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400),
    labelLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontFamily: 'Inter',
        color: AppColors.textWhite),
  );

  static TextTheme darkTextTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Inter',
        color: AppColors.textWhite),
    titleMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'Inter',
        color: AppColors.kPrimaryColor),

    headlineLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Inter',
        color: AppColors.textPrimary),
    headlineMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: 'Inter',
        color: AppColors.textPrimary),
    headlineSmall: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        fontFamily: 'Inter',
        color: AppColors.textPrimary),

    bodyLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: 'Inter',
        color: AppColors.textDarkWhite),
    bodyMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize:16,
        fontFamily: 'Inter',
        color: AppColors.textDarkWhite),
    bodySmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        fontFamily: 'Inter',
        color: AppColors.textDarkWhite),

    labelSmall: const TextStyle().copyWith(
        color: AppColors.textDarkWhite,
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w400),
    labelMedium: const TextStyle().copyWith(
        color: AppColors.textDarkWhite,
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400),
    labelLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontFamily: 'Inter',
        color: AppColors.textDarkWhite),
  );
}
