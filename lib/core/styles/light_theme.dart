import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'text_styles.dart';

final ThemeData themLight = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Rubik',
  textTheme: TextTheme(
    displayLarge: AppTextStyles.getBoldStyle(
      fontSize: 32.sp,
      color: Colors.black,
    ),
    displayMedium: AppTextStyles.getBoldStyle(
      fontSize: 28.sp,
      color: Colors.black,
    ),
    displaySmall: AppTextStyles.getBoldStyle(
      fontSize: 24.sp,
      color: Colors.black,
    ),
    headlineLarge: AppTextStyles.getSemiBoldStyle(
      fontSize: 20.sp,
      color: Colors.black,
    ),
    headlineMedium: AppTextStyles.getSemiBoldStyle(
      fontSize: 18.sp,
      color: Colors.black,
    ),
    headlineSmall: AppTextStyles.getSemiBoldStyle(
      fontSize: 16.sp,
      color: Colors.black,
    ),
    titleLarge: AppTextStyles.getMediumStyle(
      fontSize: 16.sp,
      color: Colors.black,
    ),
    titleMedium: AppTextStyles.getMediumStyle(
      fontSize: 14.sp,
      color: Colors.black,
    ),
    titleSmall: AppTextStyles.getMediumStyle(
      fontSize: 12.sp,
      color: Colors.black,
    ),
    bodyLarge: AppTextStyles.getRegularStyle(
      fontSize: 16.sp,
      color: Colors.black,
    ),
    bodyMedium: AppTextStyles.getRegularStyle(
      fontSize: 14.sp,
      color: Colors.black,
    ),
    bodySmall: AppTextStyles.getRegularStyle(
      fontSize: 12.sp,
      color: Colors.black,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: AppTextStyles.getBoldStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return AppColors.lightGreyColor;
    }),
    side: const BorderSide(color: AppColors.borderColor, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
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
    fillColor: Colors.grey[100],
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
      color: Colors.grey,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: Colors.black,
  ),
);
