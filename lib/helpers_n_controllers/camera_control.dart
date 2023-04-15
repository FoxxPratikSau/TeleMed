import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraControl extends GetxController {
  Future<List<CameraDescription>> returnCameraDescriptionList() async {
    final cameras = await availableCameras();
    return cameras;
  }
}
