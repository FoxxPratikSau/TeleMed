import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/cart_controller.dart';
import 'package:tele_med/helpers_n_controllers/cart_repo.dart';
import 'package:tele_med/helpers_n_controllers/catagories_controller.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';

Future<void> init() async {
  //controllers
  Get.lazyPut(() => medicine_controller());
  Get.lazyPut(() => doctorList_controller());
  Get.lazyPut(() => catagories_controller());
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

  //repos
  Get.lazyPut(() => CartRepo());
}
