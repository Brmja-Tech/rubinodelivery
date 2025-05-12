import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'text_styles.dart';

final ThemeData themDark = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: Colors.grey[900],
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    displayLarge: AppTextStyles.getBoldStyle(
      fontSize: 32,
      color: Colors.white,
    ),
    displayMedium: AppTextStyles.getBoldStyle(
      fontSize: 28,
      color: Colors.white,
    ),
    displaySmall: AppTextStyles.getBoldStyle(
      fontSize: 24,
      color: Colors.white,
    ),
    headlineLarge: AppTextStyles.getSemiBoldStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    headlineMedium: AppTextStyles.getSemiBoldStyle(
      fontSize: 18,
      color: Colors.white,
    ),
    headlineSmall: AppTextStyles.getSemiBoldStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    titleLarge: AppTextStyles.getMediumStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    titleMedium: AppTextStyles.getMediumStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    titleSmall: AppTextStyles.getMediumStyle(
      fontSize: 12,
      color: Colors.white,
    ),
    bodyLarge: AppTextStyles.getRegularStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    bodyMedium: AppTextStyles.getRegularStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: AppTextStyles.getRegularStyle(
      fontSize: 12,
      color: Colors.white,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    elevation: 0,
    centerTitle: true,
    titleTextStyle: AppTextStyles.getBoldStyle(
      fontSize: 20,
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 0,
      textStyle: AppTextStyles.getMediumStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[800],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16.w,
      vertical: 16.h,
    ),
    hintStyle: AppTextStyles.getRegularStyle(
      fontSize: 14,
      color: Colors.grey[400]!,
    ),
  ),
);
