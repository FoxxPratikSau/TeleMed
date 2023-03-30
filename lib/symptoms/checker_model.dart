
import 'dart:math';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class SymptomCheckerModel extends ChangeNotifier {
  late Interpreter _interpreter;
  late List<String> _diseaseNames;
  bool isModelReady = false;


  Future<void> loadModelAndDiseaseNames() async {
    _interpreter = await Interpreter.fromAsset('symptom_checker.tflite');
    String diseasesData = await rootBundle.loadString('assets/disease_names.txt');
    _diseaseNames = diseasesData.split('\n');
  }

  Future<void> loadModel() async {
    await loadModelAndDiseaseNames();
    isModelReady = true;
    notifyListeners();
  }

  String predictDisease(List<bool> symptoms) {
    if (_interpreter == null || _diseaseNames == null) {
      throw Exception('Interpreter not initialized');
    }

    // Convert symptoms to input format and run the model
    var input = symptoms.map((symptom) => symptom ? 1 : 0).toList();
    var output = List.filled(_diseaseNames.length, 0.0).reshape([1, _diseaseNames.length]);
    _interpreter.run(input, output);

    // Find the index of the highest probability
    int predictedIndex = output[0].indexWhere((x) => x == output[0].reduce((a, b) => max<num>(a, b)));

    // Return the disease name based on the index
    return _diseaseNames[predictedIndex];
  }
}
