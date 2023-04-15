import 'package:flutter/material.dart';
import 'screens/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/catagories_controller.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';
import 'package:tele_med/helpers_n_controllers/dependencies.dart' as dep;
import 'helpers_n_controllers/camera_control.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();
  final cameraControl = Get.put(CameraControl());
  runApp(MyApp(cameras: cameraControl));
}

class MyApp extends StatelessWidget {
  final CameraControl cameras;
  const MyApp({required this.cameras, super.key});

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
