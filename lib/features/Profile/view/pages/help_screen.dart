import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../../constants/assets.dart';
import '../../../../core/components/ui/custom_app_bar_func.dart';
import '../../../../core/styles/app_colors.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  final String phoneNumber = "0123456789";
  final String email = "aAA1122@AAAA.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppBar(context, text: "Help"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                spacing: 20.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20.h),
                  Text(
                    "HowToOrder".tr(),
                    style: context.textTheme.displaySmall,
                  ),
                  Text(
                    "HowToOrderDescription".tr(),
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: AppColors.greyColor),
                  ),
                  //
                  Text(
                    "OrderArrive".tr(),
                    style: context.textTheme.displaySmall,
                  ),
                  Text(
                    "OrderArriveDescription".tr(),
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: AppColors.greyColor),
                  ),
                  //
                  Text(
                    "ChangeCancelOrder".tr(),
                    style: context.textTheme.displaySmall,
                  ),
                  Text(
                    "ChangeCancelOrderDescription".tr(),
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: AppColors.greyColor),
                  ),
                  Gap(20.h),
                  Row(
                    children: [
                      Lottie.asset(
                        Assets.assetsLottieAnimationsPhone,
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                      ),
                      Gap(10.w),
                      Text(
                        "ContactUs".tr(),
                        style: context.textTheme.headlineLarge!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 5.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ContactUsDescription".tr(),
                        style: context.textTheme.bodyLarge!
                            .copyWith(color: AppColors.greyColor),
                      ),
                      Text(
                        "${"Call".tr()} $phoneNumber",
                        style: context.textTheme.bodyLarge!
                            .copyWith(color: AppColors.greyColor),
                      ),
                      Text(
                        "${"Email".tr()} $email",
                        style: context.textTheme.bodyLarge!
                            .copyWith(color: AppColors.greyColor),
                      ),
                    ],
                  ),
                  Gap(30.h),
                  Center(
                    child: Wrap(
                      spacing: 5.w,
                      runSpacing: 5.h,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "DesignedAndDevelopedBy".tr(),
                          style: context.textTheme.headlineLarge,
                        ),
                        Text(
                          "BrmjaTech".tr(),
                          style: context.textTheme.headlineLarge!
                              .copyWith(color: AppColors.orangeColor),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
