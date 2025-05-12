import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../../core/components/ui/custom_text_field.dart';
import '../../../core/router/app_router.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/widgets/custom_icon_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(40.h),
                  Text(
                    "Rubino".tr(),
                    style: context.textTheme.displayLarge!.copyWith(
                        color: AppColors.primaryColor, fontSize: 60.sp),
                  ),
                  Gap(60.h),
                  Text(
                    "Login".tr(),
                    style: context.textTheme.displayLarge,
                  ),
                  Gap(20.h),
                  Text(
                    "EnterNameAndPassword".tr(),
                    style: context.textTheme.titleLarge!.copyWith(
                      color: AppColors.greyColor2,
                    ),
                  ),
                  Gap(30.h),
                  Text(
                    "UserName".tr(),
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: AppColors.greyColor2,
                    ),
                  ),
                  Gap(10.h),
                  Customtextfield(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "UserNameRequired".tr();
                      }

                      return null;
                    },
                    isFilled: false,
                    fillColor: Colors.white,
                    hintText: "EnterUserName".tr(),
                    noBorder: true,
                    textEditingController: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Gap(20.h),
                  Text(
                    "Password".tr(),
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: AppColors.greyColor2,
                    ),
                  ),
                  Gap(10.h),
                  Customtextfield(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "PasswordRequired".tr();
                      }
                      return null;
                    },
                    hintText: "EnterPassword".tr(),
                    noBorder: true,
                    isFilled: false,
                    fillColor: Colors.white,
                    textEditingController: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isPasswordVisible,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: AppColors.greyColor2,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color: AppColors.primaryColor,
                            ),
                    ),
                  ),
                  Gap(10.h),
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        // Write your forgot password logic here
                        // For example, navigate to the forgot password screen
                      },
                      child: Text(
                        "ForgotPassword".tr(),
                        textAlign: TextAlign.end,
                        style: context.textTheme.titleMedium!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Gap(40.h),
                  CustomIconButton(
                      icon: Icons.arrow_forward,
                      onTap: () {
                        if (formKey.currentState!.validate() &&
                            emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          context.pushReplacement(AppRouters.kNavBar);
                        }
                      },
                      text: "Login".tr()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
