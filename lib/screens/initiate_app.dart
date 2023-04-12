import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_med/constants.dart';
import 'package:tele_med/essentials/auth_service.dart';
import 'package:tele_med/screens/consultation_page.dart';
import 'package:tele_med/screens/home_page.dart';
import 'package:tele_med/screens/profile_page.dart';
import 'package:tele_med/screens/shop_medicine_page.dart';
import 'package:get/get.dart';

class InitiatePage extends StatefulWidget {
  final loginController = Get.find<AuthService>();
  InitiatePage({super.key});

  @override
  State<InitiatePage> createState() => _InitiatePageState();
}

class _InitiatePageState extends State<InitiatePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    HomePage(),
    const ConsultPage(),
    const ShopMedicinePage(),
    ProfilePage(),
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
                const EdgeInsets.only(bottom: 15.0, left: 20.0, right: 20.0),
            child: PhysicalModel(
              elevation: 10.0,
              color: Colors.white,
              shadowColor: kPrimaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  //border: Border.all(color: kPrimaryColor, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    unselectedItemColor: Colors.white,
                    selectedItemColor: const Color.fromARGB(255, 20, 20, 137),
                    selectedLabelStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 12.0),
                    ),
                    showUnselectedLabels: false,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          _selectedIndex == 0
                              ? 'images/home_solid.png'
                              : 'images/home.png',
                          height: 35,
                          color: _selectedIndex == 0
                              ? const Color.fromARGB(255, 20, 20, 137)
                              : Colors.grey,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          'images/search.png',
                          height: 35,
                          color: _selectedIndex == 1
                              ? const Color.fromARGB(255, 20, 20, 137)
                              : Colors.grey,
                        ),
                        label: 'Consult',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          _selectedIndex == 2
                              ? 'images/shop_solid.png'
                              : 'images/shop.png',
                          height: 35,
                          color: _selectedIndex == 2
                              ? const Color.fromARGB(255, 20, 20, 137)
                              : Colors.grey,
                        ),
                        label: 'Buy',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          _selectedIndex == 3
                              ? 'images/profile_solid.png'
                              : 'images/profile.png',
                          height: 35,
                          color: _selectedIndex == 3
                              ? const Color.fromARGB(255, 20, 20, 137)
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
