import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../core/router/app_router.dart';
import '../../../core/styles/app_colors.dart';

class InstantRequestsItem extends StatelessWidget {
  const InstantRequestsItem({
    super.key,
    required this.instantRequests,
    required this.text,
  });
  final Map<String, dynamic> instantRequests;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 3.r,
        ),
      ),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${"OrderNumber".tr()} ${instantRequests["orderNumber"]}",
                style: context.textTheme.bodyLarge,
              ),
              Text(
                "${instantRequests["date"]}",
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          Text(
            "${"Amount".tr()} ${instantRequests["amount"]} ${"Pound".tr()}",
            style: context.textTheme.bodyLarge,
          ),
          Text(
            "${"QuantityProducts".tr()} ${instantRequests["quantityProducts"]}",
            style: context.textTheme.bodyLarge,
          ),
          Text(
            "${"Address".tr()} ${instantRequests["address"]}",
            style: context.textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              // Handle the tap event
              context.push(AppRouters.kDetailsOrderScreen, extra: true);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.r,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: Text(
                  text.tr(),
                  style: context.textTheme.headlineMedium!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
