import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../../core/components/ui/custom_app_bar_func.dart';
import '../../../../core/styles/app_colors.dart';

class TotalOrdersScreen extends StatelessWidget {
  const TotalOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orderData = [
      {
        "orderNumber": "5126516535",
        "Pound": "1000.00",
        "Quantity": "2",
        "date": "12:54PM 04/06/2025",
      },
      {
        "orderNumber": "5126516535",
        "Pound": "1000.00",
        "Quantity": "2",
        "date": "12:54PM 04/06/2025",
      },
      {
        "orderNumber": "5126516535",
        "Pound": "1000.00",
        "Quantity": "2",
        "date": "12:54PM 04/06/2025",
      },
      {
        "orderNumber": "5126516535",
        "Pound": "1000.00",
        "Quantity": "2",
        "date": "12:54PM 04/06/2025",
      },
      {
        "orderNumber": "5126516535",
        "Pound": "1000.00",
        "Quantity": "2",
        "date": "12:54PM 04/06/2025",
      },
      {
        "orderNumber": "5126516535",
        "Pound": "1000.00",
        "Quantity": "2",
        "date": "12:54PM 04/06/2025",
      }
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBar(context, text: "TotalOrders"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    children: [
                      Gap(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              // width: MediaQuery.sizeOf(context).width / 3 - 25,
                              height: 2.h,
                              color: AppColors.dividerColor,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "TotalAmount".tr(),
                                style:
                                    context.textTheme.headlineLarge!.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // width: MediaQuery.sizeOf(context).width / 3 - 25,
                              height: 2.h,
                              color: AppColors.dividerColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(30.h),
                      Text(
                        "400.00",
                        style: context.textTheme.displayLarge!.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 96.sp,
                        ),
                      ),
                      Gap(30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              // width: MediaQuery.sizeOf(context).width / 3 - 25,
                              height: 2.h,
                              color: AppColors.dividerColor,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "NumberOrders".tr(),
                                style:
                                    context.textTheme.headlineLarge!.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // width: MediaQuery.sizeOf(context).width / 3 - 25,
                              height: 2.h,
                              color: AppColors.dividerColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(30.h),
                      Text(
                        "12 طلب",
                        style: context.textTheme.displayLarge!.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 96.sp,
                        ),
                      ),
                      Gap(30.h),
                      Text(
                        "CompletedOrders".tr(),
                        style: context.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList.builder(
              itemCount: orderData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 15.h),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          spacing: 5.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${"OrderNumber".tr()} ${orderData[index]["orderNumber"]}",
                                  style: context.textTheme.labelLarge,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 7.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Text(
                                    "+ 10.00",
                                    style: context.textTheme.labelLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${orderData[index]["Pound"]} ${"Pound".tr()}",
                              style: context.textTheme.labelLarge,
                            ),
                            Text(
                              "${orderData[index]["date"]}",
                              style: context.textTheme.labelMedium!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
