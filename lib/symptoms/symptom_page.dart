import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tele_med/symptoms/checker_model.dart';
// import 'checker_model.dart';

class SymptomCheckerPage extends StatefulWidget {
  @override
  _SymptomCheckerPageState createState() => _SymptomCheckerPageState();
}

class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<bool> _selectedSymptoms = List.generate(132, (index) => false);
  bool _modelLoaded = false;

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<SymptomCheckerModel>(context, listen: false).loadModel();
  // }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        print('Loading model...');
        await context.read<SymptomCheckerModel>().loadModel();
        print('Model loaded successfully!');
        setState(() {
          _modelLoaded = true;
        });
      } catch (e) {
        print('Error loading model: $e');
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom Checker'),
      ),
      body: Consumer<SymptomCheckerModel>(
        builder: (context, model, child) {
          if (!model.isModelReady) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List<Widget>.generate(132, (index) {
                      return CheckboxListTile(
                        title: Text('Symptom ${index + 1}'),
                        value: _selectedSymptoms[index],
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedSymptoms[index] = value!;
                          });
                        },
                      );
                    }),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        String disease = model.predictDisease(_selectedSymptoms);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                            content: Text('You might have: $disease'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Done'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
