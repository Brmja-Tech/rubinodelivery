import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/DetailsOrder/view/details_order.dart';
import '../../features/PendingRequests/view/pending_requests_screen.dart';
import '../../features/Profile/view/pages/help_screen.dart';
import '../../features/Profile/view/pages/language_screen.dart';
import '../../features/Profile/view/pages/terms_conditions_screen.dart';
import '../../features/Profile/view/pages/total_orders_screen.dart';
import '../../features/Profile/view/profile_screen.dart';
import '../../features/auth/view/login_screen.dart';
import '../../features/splash/view/splash_screen.dart';
import 'custom_butom_naneBar.dart';

abstract class AppRouters {
  static const kdefultRoute = '/';
  static const ksplashScreen = '/splash';
  static const kloginScreen = '/LoginScreen';

  // --------- BottomNav ----------------
  static const String kNavBar = '/NavBar';
  // --------- Pending Requests Screen -----------
  static const String kPendingRequestsScreen = '/PendingRequestsScreen';
  // --------- Details Order Screen -----------
  static const String kDetailsOrderScreen = '/DetailsOrderScreen';
  // --------- Profile Screen -----------
  static const String kProfileScreen = '/ProfileScreen';

  static const String kTotalOrdersScreen = '/TotalOrdersScreen';
  static const String kLanguageScreen = '/LanguageScreen';
  static const String kTermsConditionsScreen = '/TermsConditionsScreen';
  static const String kHelpScreen = '/HelpScreen';

  static final GoRouter router = GoRouter(
    initialLocation: ksplashScreen,
    routes: [
      // --------- Splash Screen -----------
      GoRoute(
        path: ksplashScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),

      // --------- Login Screen -----------
      GoRoute(
        path: kloginScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),

      // --------- BottomNav ----------------
      GoRoute(
        path: kNavBar,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const BottomNavAppBar(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),

      // --------- Pending Requests Screen -----------
      GoRoute(
        path: kPendingRequestsScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: PendingRequestsScreen(title: state.extra! as String),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),

      // --------- Details Order Screen -----------
      GoRoute(
        path: kDetailsOrderScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: DetailsOrderScreen(hasButton: state.extra! as bool),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      // --------- Profile Screen -----------
      // kProfileScreen
      GoRoute(
        path: kProfileScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ProfileScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      // kTotalOrdersScreen
      GoRoute(
        path: kTotalOrdersScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const TotalOrdersScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      // kLanguageScreen
      GoRoute(
        path: kLanguageScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const LanguageScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),

      // kTermsConditionsScreen
      GoRoute(
        path: kTermsConditionsScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const TermsConditionsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      // kHelpScreen
      GoRoute(
        path: kHelpScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HelpScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}

// Reusable slide transition function
CustomTransitionPage buildPageWithSlideTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Slide from right
      const end = Offset.zero; // End at center
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}
