import 'package:flutter/material.dart';
import 'package:tele_med/screens/initiate_app.dart';
import 'screens/intro_page.dart';
import 'screens/doc_profile.dart';
import 'screens/profile_page.dart';
import 'screens/consultation_page.dart';
import 'screens/shop_medicine_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IntroPage(),
    );
  }
}
