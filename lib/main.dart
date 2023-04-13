import 'package:flutter/material.dart';
import 'screens/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/catagories_controller.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';
import 'package:tele_med/helpers_n_controllers/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

    return const GetMaterialApp(
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
