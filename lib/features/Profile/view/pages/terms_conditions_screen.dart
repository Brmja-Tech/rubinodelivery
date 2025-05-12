import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../../core/components/ui/custom_app_bar_func.dart';
import '../../../../core/styles/app_colors.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});
  final String description =
      '"يرجى ملاحظة أن هذا النص غير ثابت، بل هو نص متغير قد يتم تعديله أو تحديثه في أي وقت بناءً على الاحتياجات أو التطورات. الهدف من هذا النص هو تقديم محتوى أولي يمكن تغييره أو تخصيصه وفقًا للمتطلبات المستقبلية. ولذلك، لا يُعتبر هذا النص نهائيًا، بل هو قابل للتطوير والتحسين المستمر لضمان توافقه مع السياق والمحتوى المطلوب."';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppBar(context, text: "TermsConditions"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                spacing: 20.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20.h),
                  Text(
                    "TermsConditions".tr(),
                    style: context.textTheme.displaySmall,
                  ),
                  Text(
                    description,
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: AppColors.greyColor),
                  ),
                  Gap(20.h),
                  Text(
                    "TermsAndUse".tr(),
                    style: context.textTheme.displaySmall,
                  ),
                  Text(
                    description,
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: AppColors.greyColor),
                  ),
                  Gap(40.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Rubino",
                      style: context.textTheme.displayLarge!.copyWith(
                          color: AppColors.primaryColor, fontSize: 60.sp),
                    ),
                  ),
                  Gap(20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
