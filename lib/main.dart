import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/observer/bloc_observer.dart';
import 'core/router/app_router.dart';
import 'core/styles/app_colors.dart';
import 'core/styles/light_theme.dart';
import 'core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  getItInit();
  Bloc.observer = MyBlocObserver();

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]) // Lock orientation
      .then((_) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        fallbackLocale: const Locale('ar'),
        saveLocale: true,
        path: 'assets/lang',
        startLocale: const Locale('ar'),
        child: MyApp(),
        //  DevicePreview(
        //     enabled: true, builder: (context) => const MyApp())
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(454, 930),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            title: 'Robino Delivery',
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: themLight,
            themeMode: ThemeMode.light,
            routerConfig: AppRouters.router,
          );
        });
  }
}
