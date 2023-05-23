import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tele_med/flutter_flow/flutter_flow_theme.dart';
import 'package:tele_med/lung_cancer/lung_classifier.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:get/get.dart';

class LungCancerPage extends StatefulWidget {
  @override
  _LungCancerPageState createState() => _LungCancerPageState();
}

class _LungCancerPageState extends State<LungCancerPage> {
  File? _image;
  Classifier? _classifier;
  String _predictionResult = '';

  @override
  void initState() {
    super.initState();
    Classifier.create().then((value) => setState(() => _classifier = value));
  }

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _predictImage() async {
    if (_image == null || _classifier == null) {
      return;
    }

    final results = await _classifier!.predictImage(_image!);
    if (results != null) {
      double maxValue = results[0];
      int predictionIndex = 0;

      for (int i = 1; i < results.length; i++) {
        if (results[i] > maxValue) {
          maxValue = results[i];
          predictionIndex = i;
        }
      }

      String predictionLabel = _classifier!.labels[predictionIndex];
      setState(() {
        _predictionResult = 'Prediction: $predictionLabel';
      });
      print('Prediction: $predictionLabel');
    } else {
      print('Failed to predict. Image: $_image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        titleSpacing: 20,
        elevation: 0,
        title: BigFont(
          text: 'Lung Cancer Detection',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
              30,
              20,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? SmallFont(
                    text: 'No image selected',
                  )
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 3,
                      ),
                      color: Colors.white,
                    ),
                    child: Image.file(_image!),
                  ),
            SizedBox(height: 20),
            SmallFont(text: _predictionResult),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _getImage(),
              child: Container(
                height: 40.0,
                width: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Center(
                    child: SmallFont(
                  text: 'Select From Gallery',
                  color: Colors.white,
                )),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (_image != null) {
                  _predictImage();
                } else {
                  Get.snackbar(
                    '',
                    '',
                    duration: const Duration(seconds: 2),
                    animationDuration: const Duration(seconds: 1),
                    barBlur: 10.0,
                    titleText: BigFont(
                      text: 'Attention',
                      color: Colors.red,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                      size: 20.0,
                    ),
                    messageText: SmallFont(text: 'No Image Selected!'),
                  );
                }
              },
              child: Container(
                height: 40.0,
                width: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Center(
                    child: SmallFont(
                  text: 'Predict',
                  color: Colors.white,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
