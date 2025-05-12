import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../constants/assets.dart';
import '../../../core/styles/app_colors.dart';
import 'instant_requests_item.dart';

class InstantRequestsScreen extends StatelessWidget {
  const InstantRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> instantRequests = [
      {
        "orderNumber": "5126516535",
        "amount": "1000.00",
        "quantityProducts": "2",
        "date": "12:54PM 04/06/2025",
        "address":
            "شارع الكورنيش، عمارة رقم 12، الدور الثالث، شقة 7، حي الأعصر، دمياط، مصر",
      },
      {
        "orderNumber": "5126516535",
        "amount": "1000.00",
        "quantityProducts": "2",
        "date": "12:54PM 04/06/2025",
        "address":
            "شارع الكورنيش، عمارة رقم 12، الدور الثالث، شقة 7، حي الأعصر، دمياط، مصر",
      },
      {
        "orderNumber": "5126516535",
        "amount": "1000.00",
        "quantityProducts": "2",
        "date": "12:54PM 04/06/2025",
        "address":
            "شارع الكورنيش، عمارة رقم 12، الدور الثالث، شقة 7، حي الأعصر، دمياط، مصر",
      },
      {
        "orderNumber": "5126516535",
        "amount": "1000.00",
        "quantityProducts": "2",
        "date": "12:54PM 04/06/2025",
        "address":
            "شارع الكورنيش، عمارة رقم 12، الدور الثالث، شقة 7، حي الأعصر، دمياط، مصر",
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Gap(20.h),
                  ListTile(
                    leading: ClipOval(
                      child: Image.asset(
                        Assets.assetsImgPngAyman,
                      ),
                    ),
                    title: Text(
                      'DeliveryRepresentative'.tr(),
                      style: context.textTheme.headlineLarge!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsetsDirectional.only(top: 5.h),
                      child: Text(
                        'ايمن منصور',
                        style: context.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.primaryColor,
                    thickness: 2.r,
                  ),
                  Gap(20.h),
                  StatusButton(),
                  Gap(20.h),
                ],
              ),
            ),
            SliverList.builder(
                itemCount: instantRequests.length,
                itemBuilder: (context, index) {
                  return InstantRequestsItem(
                    instantRequests: instantRequests[index],
                    text: "DetailsOrder",
                  );
                }),
          ]),
        ),
      ),
    );
  }
}

class StatusButton extends StatefulWidget {
  const StatusButton({
    super.key,
  });

  @override
  State<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  bool isAvailable = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w,
      padding: EdgeInsetsDirectional.all(5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color:
              isAvailable ? AppColors.lightGreenColor : AppColors.primaryColor,
          width: 2.r,
        ),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        spacing: 5.w,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isAvailable = true;
                });
              },
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: isAvailable ? AppColors.lightGreenColor : Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Text(
                    "Available".tr(),
                    style: context.textTheme.labelLarge!.copyWith(
                      color: isAvailable ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isAvailable = false;
                });
              },
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: isAvailable ? Colors.white : AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Text(
                    "NotAvailable".tr(),
                    style: context.textTheme.labelLarge!.copyWith(
                      color: isAvailable ? Colors.grey : Colors.white,
                    ),
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
