import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_med/Log_in_page/Intro_log_in.dart';
import 'package:tele_med/Log_in_page/log_in_doctor.dart';
import 'package:tele_med/Log_in_page/splash_screen.dart';
import 'package:tele_med/helpers_n_controllers/catagories_controller.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';
import 'package:tele_med/home_page/E-commerce_medicine.dart';
import 'package:tele_med/home_page/consultation_page.dart';
import 'package:tele_med/helpers_n_controllers/dependencies.dart' as dep;
import 'package:tele_med/screens/consultation_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<medicine_controller>().getMedicineList();
    Get.find<medicine_controller>().getMedicine2List();
    Get.find<doctorList_controller>().getDoctorsList();
    Get.find<catagories_controller>().getCatagoryList();

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: consultation_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
