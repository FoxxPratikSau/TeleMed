// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tele_med/skin_cancer/classifier.dart';

class SkinPage extends StatefulWidget {
  @override
  _SkinPageState createState() => _SkinPageState();
}

class _SkinPageState extends State<SkinPage> {
  Classifier? _classifier;
  File? _imageFile;
  List<Map<String, dynamic>>? _predictions;

  @override
  void initState() {
    super.initState();
    Classifier.create().then((value) {
      setState(() {
        _classifier = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Skin Cancer Detection')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageFile == null
                  ? Text('No image selected.')
                  : Image.file(_imageFile!),
              _predictions == null
                  ? Container()
                  : Text(
                      'Predictions: ${_predictions![0]['label']} (${_predictions![0]['confidence'].toStringAsFixed(2)}), ${_predictions![1]['label']} (${_predictions![1]['confidence'].toStringAsFixed(2)})',
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final pickedImage =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (pickedImage != null) {
              final imageFile = File(pickedImage.path);
              final predictions = _classifier?.predict(imageFile);
              setState(() {
                _imageFile = imageFile;
                _predictions = predictions;
              });
            }
          },
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ));
  }
}
