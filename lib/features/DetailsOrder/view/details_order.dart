import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../constants/assets.dart';
import '../../../core/components/ui/custom_app_bar_func.dart';
import '../../../core/router/app_router.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';

class DetailsOrderScreen extends StatefulWidget {
  const DetailsOrderScreen({super.key, required this.hasButton});
  final bool hasButton;

  @override
  State<DetailsOrderScreen> createState() => _DetailsOrderScreenState();
}

class _DetailsOrderScreenState extends State<DetailsOrderScreen> {
  final Map<String, dynamic> orderDetails = {
    "AccountOrder": "400",
    "quantityProducts": "6",
    "Street":
        "شارع الكورنيش، عمارة رقم 12، الدور الثالث، شقة 7، حي الأعصر، دمياط، مصر",
    "BuildingNumber": "6",
    "DoorNumber": "15",
    "ApartmentNumber": "6",
    "DeliveryService": "15",
    "Total": "415",
    "Order": [
      {
        'title': 'جبنة دومتى فيتا',
        "quantity": " 125جم",
        "number": "4",
        "price": "163.00",
        "totalPrice": "652.00",
        "type": "منتجات الألبان",
        "image": Assets.assetsImgPngProduct,
      },
      {
        'title': 'جبنة دومتى فيتا',
        "quantity": " 125جم",
        "number": "4",
        "price": "163.00",
        "totalPrice": "652.00",
        "type": "منتجات الألبان",
        "image": Assets.assetsImgPngProduct,
      },
      {
        'title': 'جبنة دومتى فيتا',
        "quantity": " 125جم",
        "number": "4",
        "price": "163.00",
        "totalPrice": "652.00",
        "type": "منتجات الألبان",
        "image": Assets.assetsImgPngProduct,
      },
      {
        'title': 'جبنة دومتى فيتا',
        "quantity": " 125جم",
        "number": "4",
        "price": "163.00",
        "totalPrice": "652.00",
        "type": "منتجات الألبان",
        "image": Assets.assetsImgPngProduct,
      },
      {
        'title': 'جبنة دومتى فيتا',
        "quantity": " 125جم",
        "number": "4",
        "price": "163.00",
        "totalPrice": "652.00",
        "type": "منتجات الألبان",
        "image": Assets.assetsImgPngProduct,
      }
    ],
  };
  bool isAccept = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customAppBar(context, text: "DetailsOrder"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "Address2".tr(),
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
                        Gap(20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10.h,
                          children: [
                            Text(
                              "Street".tr(),
                              style: context.textTheme.headlineMedium!.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${orderDetails["Street"]}",
                              style: context.textTheme.headlineMedium,
                            ),
                          ],
                        ),
                        Gap(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3 - 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10.h,
                                children: [
                                  Text(
                                    "BuildingNumber".tr(),
                                    style: context.textTheme.headlineMedium!
                                        .copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "${orderDetails["BuildingNumber"]}",
                                    style: context.textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3 - 20,
                              child: Column(
                                spacing: 10.h,
                                children: [
                                  Text(
                                    "DoorNumber".tr(),
                                    style: context.textTheme.headlineMedium!
                                        .copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "${orderDetails["DoorNumber"]}",
                                    style: context.textTheme.headlineMedium!,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3 - 20,
                              child: Column(
                                spacing: 10.h,
                                children: [
                                  Text(
                                    "ApartmentNumber".tr(),
                                    style: context.textTheme.headlineMedium!
                                        .copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "${orderDetails["ApartmentNumber"]}",
                                    style: context.textTheme.headlineMedium!,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                                  "Account".tr(),
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
                        Gap(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3 - 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10.h,
                                children: [
                                  Text(
                                    "AccountOrder".tr(),
                                    style: context.textTheme.headlineMedium!
                                        .copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "${orderDetails["AccountOrder"]} ${"Pound".tr()}",
                                    style: context.textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3 - 20,
                              child: Column(
                                spacing: 10.h,
                                children: [
                                  Text(
                                    "QuantityProducts2".tr(),
                                    style: context.textTheme.headlineMedium!
                                        .copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    orderDetails["quantityProducts"],
                                    style: context.textTheme.headlineMedium!,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3 - 10,
                              child: Column(
                                spacing: 10.h,
                                children: [
                                  Text(
                                    "DeliveryService".tr(),
                                    style: context.textTheme.headlineMedium!
                                        .copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    orderDetails["DeliveryService"] +
                                        " ${"Pound".tr()}",
                                    style: context.textTheme.headlineMedium!
                                        .copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total".tr(),
                                    style: context.textTheme.headlineMedium!
                                        .copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    " ${orderDetails["Total"]} ${"Pound".tr()}",
                                    style: context.textTheme.headlineLarge!
                                        .copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
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
                        InkWell(
                          onTap: () {
                            // Handle the tap event
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
                                "ShowOnMap".tr(),
                                style:
                                    context.textTheme.headlineMedium!.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
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
                                  "DetailsOrder".tr(),
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
                        Gap(20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList.builder(
              itemCount: orderDetails["Order"].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: DetailsOrderItem(
                    order: orderDetails["Order"][index],
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: widget.hasButton
                    ? isAccept
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: CustomButton(
                                width: MediaQuery.sizeOf(context).width - 40,
                                text: "EndDelivery".tr(),
                                onPressed: () {}),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  width:
                                      MediaQuery.sizeOf(context).width / 2 - 20,
                                  text: "Decline".tr(),
                                  onPressed: () {}),
                              Gap(10.w),
                              CustomButton(
                                color: AppColors.lightGreenColor,
                                width:
                                    MediaQuery.sizeOf(context).width / 2 - 20,
                                text: "Accept".tr(),
                                onPressed: () {
                                  showDialogOrder(context);
                                  setState(() {
                                    isAccept = true;
                                  });
                                },
                              ),
                            ],
                          )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: CustomButton(
                            width: MediaQuery.sizeOf(context).width - 40,
                            text: "EndDelivery".tr(),
                            onPressed: () {}),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDialogOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          actionsPadding: EdgeInsets.symmetric(horizontal: 10.w),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  size: 30.r,
                ),
              ),
            ),
            Column(
              children: [
                Image.asset(
                  Assets.assetsImgPngPreparingOrder,
                  width: 200.w,
                  height: 200.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text("PreparingOrder".tr(),
                      style: context.textTheme.displaySmall),
                ),
                Text(
                  "PreparingOrder2".tr(),
                  style: context.textTheme.headlineLarge!.copyWith(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomIconButton(
                    text: "NewOrder".tr(),
                    icon: Icons.arrow_forward_outlined,
                    onTap: () {
                      context.go(AppRouters.kNavBar);
                    },
                  ),
                ),
                Gap(10.h),
                TextButton(
                  onPressed: () {
                    context.go(AppRouters.kNavBar);
                  },
                  child: Text("BackToHome".tr(),
                      style: context.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Gap(20.h),
              ],
            )
          ],
        );
      },
    );
  }
}

class DetailsOrderItem extends StatelessWidget {
  const DetailsOrderItem({super.key, required this.order});
  final Map<String, dynamic> order;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(order["image"], width: 80.w, height: 80.h),
            Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order["title"] + " ${order["quantity"]}",
                  style: context.textTheme.headlineMedium,
                ),
                Text(
                  order["type"],
                  style: context.textTheme.headlineMedium!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: AppColors.greyColor3,
                          width: 2.r,
                        ),
                      ),
                      child: Text(
                        order["number"],
                        style: context.textTheme.headlineMedium,
                      ),
                    ),
                    Gap(20.w),
                    Text(
                      "${order["price"]} ${"Pound".tr()}",
                      style: context.textTheme.headlineMedium!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Gap(30.w),
                    Text(
                      "${order["totalPrice"]} ${"Pound".tr()}",
                      style: context.textTheme.headlineMedium!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Gap(5.w),
                    Icon(Icons.arrow_forward_ios_rounded,
                        color: AppColors.primaryColor, size: 20.r),
                  ],
                ),
              ],
            ),
          ],
        ),
        Gap(5.h),
        Divider(
          color: AppColors.dividerColor,
          thickness: 2.r,
        ),
        Gap(5.h),
      ],
    );
  }
}
