import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../../core/components/ui/custom_app_bar_func.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool isArabic = false, isEnglish = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isArabic = context.locale.languageCode == 'ar';
    isEnglish = context.locale.languageCode == 'en';
  }

  void changeLanguage(Locale locale) {
    context.setLocale(locale);
    log('Locale changed to: ${locale.languageCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(context, text: "Languages"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Arabic".tr(), style: context.textTheme.headlineLarge),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: isArabic,
                        onChanged: (value) {
                          if (value == true) {
                            changeLanguage(const Locale('ar'));
                            setState(() {
                              isArabic = true;
                              isEnglish = false;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("English".tr(),
                        style: context.textTheme.headlineLarge),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: isEnglish,
                        onChanged: (value) {
                          if (value == true) {
                            changeLanguage(const Locale('en'));
                            setState(() {
                              isEnglish = true;
                              isArabic = false;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
