import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  late Interpreter _interpreter;

  Classifier._(this._interpreter);

  static Future<Classifier> create() async {
    final interpreterOptions = InterpreterOptions()..threads = 4;
    final interpreter = await Interpreter.fromAsset(
      'assets/skin_cancer.tflite',
      options: interpreterOptions,
    );
    return Classifier._(interpreter);
  }

  List<Map<String, dynamic>> predict(File imageFile) {
    img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;
    img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

    var imgBytes = resizedImage.getBytes();
    Float32List input = Float32List.fromList(_normalize(imgBytes));

    Float32List output = Float32List(2);

    _interpreter.run(input.buffer.asFloat32List(), output.buffer.asFloat32List());

    return [
      {'label': 'Benign', 'confidence': output[0]},
      {'label': 'Malignant', 'confidence': output[1]},
    ];
  }

  List<double> _normalize(Uint8List imgBytes) {
    List<double> normalizedValues = [];

    for (var i = 0; i < imgBytes.length; i += 4) {
      final r = imgBytes[i] / 255;
      final g = imgBytes[i + 1] / 255;
      final b = imgBytes[i + 2] / 255;

      normalizedValues.add(r);
      normalizedValues.add(g);
      normalizedValues.add(b);
    }

    return normalizedValues;
  }
}
