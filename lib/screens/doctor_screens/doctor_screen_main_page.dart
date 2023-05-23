// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tele_med/screens/doctor_screens/notification_screen.dart';
import 'package:tele_med/screens/doctor_screens/appointments.dart';
import 'package:tele_med/screens/doctor_screens/doctor_profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class doctor_screen_main_page extends StatefulWidget {
  const doctor_screen_main_page({super.key, required this.pageId});
  final int pageId;

  @override
  State<doctor_screen_main_page> createState() =>
      _doctor_screen_main_pageState();
}

class _doctor_screen_main_pageState extends State<doctor_screen_main_page> {
  var _selectedIndex = 0;
  late PersistentTabController _controller;
  List pages = [
    appointments(
      pageID: 0,
    ),
    NotificationApp(),
    doctor_profile(
      pageID: 0,
    ),
  ];

  void ontapNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      appointments(
        pageID: widget.pageId,
      ),
      NotificationApp(),
      doctor_profile(
        pageID: widget.pageId,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.calendar),
        title: ("Appointments"),
        activeColorPrimary: Color.fromARGB(255, 247, 70, 97),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bell),
        title: ("Notifications"),
        activeColorPrimary: Color.fromARGB(255, 75, 78, 237),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: Color.fromARGB(255, 6, 80, 60),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style11, // Choose the nav bar style with this property.
    );
  }
}
