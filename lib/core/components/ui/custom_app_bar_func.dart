import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

AppBar customAppBar(BuildContext context, {required String text}) {
  return AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    elevation: 0,
    surfaceTintColor: Colors.white,
    title: Text(text.tr(), style: context.textTheme.displaySmall),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: Colors.black,
      ),
    ),
  );
}
