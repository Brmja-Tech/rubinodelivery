import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../constants/assets.dart';
import '../../../core/components/ui/custom_button.dart';
import '../../../core/router/app_router.dart';

import '../../../core/styles/app_colors.dart';
import 'components/custom_profile_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: 20.h, start: 10.w),
                child: ListTile(
                  leading: ClipOval(
                    child: Image.asset(
                      Assets.assetsImgPngAyman,
                    ),
                  ),
                  title: Text(
                    'ايمن منصور',
                    style: context.textTheme.headlineLarge,
                  ),
                  subtitle: Padding(
                    padding: EdgeInsetsDirectional.only(top: 5.h),
                    child: Text(
                      "AAA11223@gmail.com",
                      style: context.textTheme.headlineSmall!
                          .copyWith(color: AppColors.greyColor),
                    ),
                  ),
                ),
              ),
              Gap(10.h),
              Divider(
                color: AppColors.dividerColor,
                thickness: 2.r,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  accountRow(context,
                      title: "OrderHistory".tr(),
                      image: Assets.assetsImgSvgOrderHistory,
                      extra: "OrderHistory",
                      route: AppRouters.kPendingRequestsScreen),
                  accountRow(context,
                      title: "TotalOrders".tr(),
                      image: Assets.assetsImgSvgTotalOrders,
                      route: AppRouters.kTotalOrdersScreen),
                  accountRow(context,
                      title: "Language".tr(),
                      image: Assets.assetsImgSvgLanguage,
                      route: AppRouters.kLanguageScreen),
                  accountRow(context,
                      title: "Help".tr(),
                      image: Assets.assetsImgSvgHelp,
                      route: AppRouters.kHelpScreen),
                  accountRow(context,
                      title: "TermsConditions".tr(),
                      image: Assets.assetsImgSvgTermsConditions,
                      route: AppRouters.kTermsConditionsScreen),
                  Gap(20.h),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomElevatedButton(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          Assets.assetsImgSvgLogOut,
                        ),
                      ),
                      color: AppColors.primaryColor,
                      text: "LogOut".tr(),
                      onPressed: () {},
                    ),
                  ),
                  Gap(20.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
