import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tele_med/models/catagories.dart';

class catagories_controller extends GetxController {
  List<Category> _catagorylist = [];
  List<Category> get catagorylist => _catagorylist;

  final bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getCatagoryList() async {
    print("xyz");
    final String DoctorsJson =
        await rootBundle.loadString("assets/files/catagories.json");
    final decodedData = json.decode(DoctorsJson);
    // Parse the JSON data using the fromJson method of the medicine class
    _catagorylist = (decodedData["categories"] as List<dynamic>)
        .map((e) => Category.fromJson(e))
        .toList();

    update();
  }
}
