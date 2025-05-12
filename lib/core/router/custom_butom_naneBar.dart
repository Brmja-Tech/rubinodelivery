import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rubinodelivery/core/utils/context_ex.dart';

import '../../constants/assets.dart';
import '../../features/InstantRequests/view/instant_requests_screen.dart';
import '../../features/PendingRequests/view/pending_requests_screen.dart';
import '../../features/Profile/view/profile_screen.dart';
import '../styles/app_colors.dart';

class BottomNavAppBar extends StatefulWidget {
  const BottomNavAppBar({super.key});

  @override
  BottomNavAppBarState createState() => BottomNavAppBarState();
}

class BottomNavAppBarState extends State<BottomNavAppBar> {
  int _selectedIndex = 0;
  List<Widget> _pages = [];
  DateTime? _lastPressed;

  // String type = CacheHelper().getData(key: 'userType');

  @override
  void initState() {
    super.initState();
    _initializePages();
  }

  void _initializePages() {
    setState(() {
      _pages = [
        // const HomeScreen(),

        const InstantRequestsScreen(),
        const PendingRequestsScreen(title: "PendingRequests"),
        const ProfileScreen(),
      ];
    });
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    } else {
      final now = DateTime.now();
      if (_lastPressed == null ||
          now.difference(_lastPressed!) > const Duration(seconds: 2)) {
        _lastPressed = now;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            content: Text(
              'PressBackAgainToExit'.tr(),
              style: context.textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        );
        return false;
      }
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          height: 90.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, -2), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(30.r),
              topEnd: Radius.circular(30.r),
            ),
            child: BottomNavigationBar(
              selectedLabelStyle: context.textTheme.headlineMedium,
              unselectedLabelStyle: context.textTheme.headlineMedium,
              backgroundColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.black,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 5.h),
                    child: SvgPicture.asset(
                      Assets.assetsImgSvgMenu,
                      color: _selectedIndex == 0
                          ? AppColors.primaryColor
                          : Colors.black,
                    ),
                  ),
                  label: 'InstantRequests'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 5.h),
                    child: SvgPicture.asset(
                      Assets.assetsImgSvgLoad,
                      color: _selectedIndex == 1
                          ? AppColors.primaryColor
                          : Colors.black,
                    ),
                  ),
                  label: 'PendingRequests'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 5.h),
                    child: const Icon(Icons.person),
                  ),
                  label: 'Profile'.tr(),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
