import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  static const String MODEL_FILE_NAME = "assets/Lung_cancer.tflite";
  static const List<String> LABELS = ['Normal', 'Pneumonia'];

  Interpreter _interpreter;

  Classifier._(this._interpreter);

  static Future<Classifier> create() async {
    final interpreter = await _loadModel();
    return Classifier._(interpreter!);
  }

  static Future<Interpreter?> _loadModel() async {
    try {
      print("loading model..........");
      final modelData = await rootBundle.load(MODEL_FILE_NAME);
      final modelDataBuffer = modelData.buffer.asUint8List();

      final options = InterpreterOptions()..threads = 4;
      final interpreter =
          await Interpreter.fromBuffer(modelDataBuffer, options: options);
      print("Model loaded successfully");
      return interpreter;
    } catch (e) {
      print("Error while loading the model: $e");
      return null;
    }
  }

  List<String> get labels => LABELS;

  Future<List<double>?> predictImage(File imageFile) async {
    if (_interpreter == null) {
      print("Interpreter not loaded");
      return null;
    }

    img.Image? image = img.decodeImage(await imageFile.readAsBytes());
    img.Image resizedImage = img.copyResize(image!, width: 224, height: 224);

    var inputData = _imageToByteListFloat32(resizedImage, 224, 224);
    var outputData = Float32List(2).reshape([1, 2]);

    _interpreter.run(inputData, outputData);

    return outputData[0];
  }

  Uint8List _imageToByteListFloat32(img.Image image, int width, int height) {
    var convertedBytes = Float32List(1 * width * height * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel)) / 255;
        buffer[pixelIndex++] = (img.getGreen(pixel)) / 255;
        buffer[pixelIndex++] = (img.getBlue(pixel)) / 255;
      }
    }

    return convertedBytes.buffer.asUint8List();
  }
}
