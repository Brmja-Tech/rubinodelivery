import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';

extension ContextExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom != 0;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isArabic => Localizations.localeOf(this).languageCode == 'ar';

  TextDirection get textDirection =>
      isArabic ? TextDirection.rtl : TextDirection.ltr;

  FocusScopeNode get focusScopeNode => FocusScope.of(this);

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        showCloseIcon: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                message,
                // style: blackLight15.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 25, right: 20, left: 20),
      ),
    );
  }

  void showSuccessMessage(
    String message, {
    Color color = Colors.green,
    IconData icon = Icons.check_circle,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          showCloseIcon: false,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  message,
                  // style:
                  // TextStyles.blackLight15.copyWith(color: Colors.black),
                  // textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 10),
              Icon(icon, color: color),
            ],
          ),
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          margin: const EdgeInsets.only(bottom: 25, right: 20, left: 20),
        ),
      );
    });
  }

  void showSuccessDialog(String text) {
    showDialog(
      context: this,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: Text(
          text,
          // style: TextStyles.blackLight15.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.all(20).copyWith(bottom: 40),
      ),
    );
  }

  void showAlertDialog(String text, Function()? onPressed) {
    showDialog(
      context: this,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.all(20).copyWith(bottom: 40),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () => Navigator.of(this).pop(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: onPressed,
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void showErrorDialog(String text) {
    showDialog(
      context: this,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(height: 20),
            Text(
              text,
              // style: theme.textTheme.bodyText1?.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(this).pop(),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  void showLoadingDialog({
    String? message,
    bool canPop = true,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return PopScope(
          canPop: canPop,
          child:
              //  LoadingDialog()),
              AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            content: SizedBox(
              height: 200.h,
              width: 400.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child:
                          CircularProgressIndicator()), // CircularProgressIndicator.adaptive(),
                  message != null
                      ? const SizedBox(height: 10)
                      : const SizedBox.shrink(),
                  message != null
                      ? Text(
                          message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.black),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.all(20).copyWith(bottom: 40),
          ),
        );
      },
    );
  }
}
