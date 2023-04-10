import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_med/Log_in_page/Intro_log_in.dart';
import 'package:tele_med/Log_in_page/log_in_doctor.dart';
import 'package:tele_med/Log_in_page/splash_screen.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';
import 'package:tele_med/home_page/E-commerce_medicine.dart';
import 'package:tele_med/home_page/consultation_page.dart';
import 'package:tele_med/helpers_n_controllers/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<medicine_controller>().getMedicineList();
    Get.find<medicine_controller>().getMedicine2List();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: e_commerce_medicine(),
      debugShowCheckedModeBanner: false,
    );
  }
}
