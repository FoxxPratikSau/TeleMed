import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tele_med/models/doctors.dart';

class doctorList_controller extends GetxController {
  List<Doctor> _doctorlist = [];
  List<Doctor> get doctorlist => _doctorlist;

  // late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getDoctorsList() async {
    // print("xyz");
    final String DoctorsJson =
        await rootBundle.loadString("assets/files/doctors.json");
    final decodedData = json.decode(DoctorsJson);
    // Parse the JSON data using the fromJson method of the medicine class
    _doctorlist = (decodedData["doctors"] as List<dynamic>)
        .map((e) => Doctor.fromJson(e))
        .toList();

    update();
  }
}
