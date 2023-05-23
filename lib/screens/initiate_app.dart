import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_med/flutter_flow/flutter_flow_theme.dart';
import 'package:tele_med/screens/features_screen.dart';
import 'package:tele_med/screens/medicine_store/medicine_store_widget.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/essentials/auth_service.dart';
import 'package:tele_med/screens/home_page/home_page.dart';
import 'package:get/get.dart';

import 'profile/profile_widget.dart';

class InitiatePage extends StatefulWidget {
  final loginController = Get.find<AuthService>();
  InitiatePage({super.key});

  @override
  State<InitiatePage> createState() => _InitiatePageState();
}

class _InitiatePageState extends State<InitiatePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    HomePageWidget(),
    FeaturesScreen(),
    const MedicineStoreWidget(),
    ProfileWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _pages[_selectedIndex],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 15.0, left: 25.0, right: 25.0),
            child: PhysicalModel(
              elevation: 5.0,
              color: Colors.white,
              shadowColor: FlutterFlowTheme.of(context).primary,
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  //border: Border.all(color: kPrimaryColor, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    unselectedItemColor: Colors.white,
                    selectedItemColor: FlutterFlowTheme.of(context).primary,
                    selectedLabelStyle: FlutterFlowTheme.of(context)
                        .bodySmall
                        .override(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            fontSize: 12.0),
                    showUnselectedLabels: false,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          _selectedIndex == 0
                              ? 'images/home_solid.png'
                              : 'images/home.png',
                          height: 25,
                          color: _selectedIndex == 0
                              ? FlutterFlowTheme.of(context).primary
                              : Colors.grey,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          'assets/images/lab.png',
                          height: 40,
                          color: _selectedIndex == 1 ? null : Colors.grey,
                        ),
                        label: 'Features',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          _selectedIndex == 2
                              ? 'images/shop_solid.png'
                              : 'images/shop.png',
                          height: 25,
                          color: _selectedIndex == 2
                              ? FlutterFlowTheme.of(context).primary
                              : Colors.grey,
                        ),
                        label: 'Buy',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          _selectedIndex == 3
                              ? 'images/profile_solid.png'
                              : 'images/profile.png',
                          height: 25,
                          color: _selectedIndex == 3
                              ? FlutterFlowTheme.of(context).primary
                              : Colors.grey,
                        ),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
