import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../../core/styles/app_colors.dart';

Widget accountRow(BuildContext context,
    {required String title,
    required String image,
    bool? isLogout,
    Object? extra,
    bool? isHaveIcon,
    void Function()? onTap,
    String? route}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap ??
            () {
              if (isLogout ?? false) {
                // Remove Token and nav to login
                // CacheManager.removeData('accessToken');
                // context.push(AppRouters.login);
              } else {
                route != null
                    ? GoRouter.of(context).push(route, extra: extra)
                    : null;
              }
            },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Row(
            children: [
              isHaveIcon ?? false
                  ? Icon(
                      Icons.privacy_tip_outlined,
                      color: Theme.of(context).primaryColor,
                    )
                  : SizedBox(
                      width: 25.r,
                      height: 25.r,
                      child: SvgPicture.asset(
                        image,
                        // ignore: deprecated_member_use
                        // color:
                        //     isLogout ?? true ? AppColors.primaryColor : Colors.red,
                      ),
                    ),
              Gap(25.w),
              Text(
                title,
                style: context.textTheme.headlineMedium,
              ),
              const Spacer(),
              isLogout ?? true
                  ? Icon(
                      Icons.arrow_forward_ios_rounded,
                      // color: Theme.of(context).primaryColor,
                      size: 25.r,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Divider(
          color: AppColors.dividerColor,
          thickness: 2.r,
        ),
      ),
    ],
  );
}
