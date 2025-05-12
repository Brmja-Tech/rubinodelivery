import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import 'pending_requests_item.dart';

class PendingRequestsScreen extends StatelessWidget {
  const PendingRequestsScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pendingRequests = [
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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Gap(40.h),
                    Text(
                      title.tr(),
                      style: context.textTheme.displaySmall,
                    ),
                    Gap(30.h),
                  ],
                ),
              ),
              SliverList.builder(
                  itemCount: pendingRequests.length,
                  itemBuilder: (context, index) {
                    return PendingRequestsItem(
                      pendingRequests: pendingRequests[index],
                      text: "DetailsOrder",
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
