import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/assets.dart';
import '../../styles/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color? color;
  final double radius;
  final TextStyle? textStyle;
  final bool? isLoading;
  final bool? isHaveStartIcon;
  final Widget? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
    this.color,
    this.radius = 30,
    this.textStyle,
    this.isLoading,
    SizedBox? child,
    this.isHaveStartIcon,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: isLoading ?? false
            ? const CircularProgressIndicator(color: Colors.white)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isHaveStartIcon ?? false
                      ? Padding(
                          padding: EdgeInsetsDirectional.only(start: 20.w),
                          child: SvgPicture.asset(Assets.assetsImgSvgGoogle),
                        )
                      : const SizedBox(),
                  Text(
                    text,
                    style: textStyle ??
                        Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white, fontSize: 16.sp),
                  ),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: icon ??
                        Transform.rotate(
                          angle: 3.14,
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: AppColors.primaryColor,
                            size: 25.sp,
                          ),
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
