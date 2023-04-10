import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';

Future<void> init() async {
  //controllers
  Get.lazyPut(() => medicine_controller());
}
