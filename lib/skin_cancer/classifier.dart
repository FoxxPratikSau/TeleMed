import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'dart:ui';

class Classifier {
  static const String MODEL_FILE = 'skin_cancer.tflite';
  static const int INPUT_SIZE = 224;
  static const List<String> LABELS = ['Benign', 'Malignant'];
  List<String> get labels => ['Benign', 'Malignant'];

  tfl.Interpreter? _interpreter;

  factory Classifier() {
    return Classifier._internal();
  }

  Classifier._internal() {
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      print("load model..........");
      var interpreterOptions = tfl.InterpreterOptions();
      _interpreter = await tfl.Interpreter.fromAsset(MODEL_FILE,
          options: interpreterOptions);
      print('Model loaded successfully.'); // Add this line
    } on Exception {
      print('Failed to load the model.');
      _interpreter = null;
    }
  }

  Future<List<dynamic>?> predictImage(File? image) async {
    if (image == null || _interpreter == null) {
      print('Image or interpreter is null.');
      return null;
    }

    img.Image? resizedImage =
        _resizeImage(img.decodeImage(image.readAsBytesSync()));
    if (resizedImage == null) {
      print('Failed to resize image.');
      return null;
    }

    var input = imageToByteListFloat32(resizedImage, INPUT_SIZE, 127.5, 127.5);
    var output =
        List<double>.filled(LABELS.length, 0).reshape([1, LABELS.length]);

    try {
      _interpreter!.run(input, output);
    } catch (e) {
      print('Error during inference: $e');
      return null;
    }

    return output[0];
  }

  img.Image? _resizeImage(img.Image? image) {
    if (image == null) return null;
    return img.copyResize(image, width: INPUT_SIZE, height: INPUT_SIZE);
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (int i = 0; i < inputSize; ++i) {
      for (int j = 0; j < inputSize; ++j) {
        int pixel = image.getPixelSafe(j, i);
        int red = img.getRed(pixel);
        int green = img.getGreen(pixel);
        int blue = img.getBlue(pixel);
        buffer[pixelIndex++] = (red - mean) / std;
        buffer[pixelIndex++] = (green - mean) / std;
        buffer[pixelIndex++] = (blue - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  void dispose() {
    _interpreter?.close();
  }
}
