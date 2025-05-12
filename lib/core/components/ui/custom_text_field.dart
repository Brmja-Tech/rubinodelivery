import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../styles/app_colors.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      this.prefix,
      this.suffix,
      this.obscureText = false,
      this.isFilled = false,
      this.maxLines = 1, // Default value for maxLines
      this.validator,
      this.fillColor,
      this.keyboardType,
      this.onSubmitted,
      this.noBorder,
      this.radius,
      this.hintStyle});
  final String hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool? noBorder;
  final TextEditingController textEditingController;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final int maxLines; // Allows customization of max lines
  final double? radius;
  final bool isFilled;
  final TextInputType? keyboardType; // Dynamic type for flexibility
  final String? Function(String?)? onSubmitted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onFieldSubmitted: onSubmitted,
        keyboardType: keyboardType,
        style: context.textTheme.headlineLarge,
        validator: validator,
        controller: textEditingController,
        obscureText: obscureText,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor:
              isFilled ? Theme.of(context).scaffoldBackgroundColor : fillColor,
          filled: true,
          hintStyle:
              hintStyle ?? TextStyle(color: Colors.grey, fontSize: 16.sp),
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: noBorder ?? false
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greyColor3),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 10.r),
                ),
          enabledBorder: noBorder ?? false
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greyColor3),
                )
              : null,
          focusedBorder: noBorder ?? false
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greyColor3),
                )
              : null,
          errorStyle: const TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
