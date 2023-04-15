// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/widgets/small_font.dart';

class SymptomChecker extends StatefulWidget {
  const SymptomChecker({super.key});

  @override
  _SymptomCheckerState createState() => _SymptomCheckerState();
}

class _SymptomCheckerState extends State<SymptomChecker>
    with TickerProviderStateMixin {
  String? _disease;
  final TextEditingController _searchQueryController = TextEditingController();
  String _filter = '';
  bool _isSearching = false;
  late AnimationController _animationController;
  final GlobalKey<AnimatedListState> selectedSymptomListKey =
      GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _searchQueryController.addListener(() {
      setState(() {
        _filter = _searchQueryController.text;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchQueryController.dispose();
    super.dispose();
  }

  // Add your symptom list here
  List<String> symptomList = [
    'Itching',
    'Skin Rash',
    'Nodal Skin Eruptions',
    'Continuous Sneezing',
    'Shivering',
    'Chills',
    'Joint Pain',
    'Stomach Pain',
    'Acidity',
    'Ulcers On Tongue',
    'Muscle Wasting',
    'Vomiting',
    'Burning Micturition',
    'Spotting Urination',
    'Fatigue',
    'Weight Gain',
    'Anxiety',
    'Cold Hands And Feets',
    'Mood Swings',
    'Weight Loss',
    'Restlessness',
    'Lethargy',
    'Patches In Throat',
    'Irregular Sugar Level',
    'Cough',
    'High Fever',
    'Sunken Eyes',
    'Breathlessness',
    'Sweating',
    'Dehydration',
    'Indigestion',
    'Headache',
    'Yellowish Skin',
    'Dark Urine',
    'Nausea',
    'Loss Of Appetite',
    'Pain Behind The Eyes',
    'Back Pain',
    'Constipation',
    'Abdominal Pain',
    'Diarrhoea',
    'Mild Fever',
    'Yellow Urine',
    'Yellowing Of Eyes',
    'Acute Liver Failure',
    'Fluid Overload',
    'Swelling Of Stomach',
    'Swelled Lymph Nodes',
    'Malaise',
    'Blurred And Distorted Vision',
    'Phlegm',
    'Throat Irritation',
    'Redness Of Eyes',
    'Sinus Pressure',
    'Runny Nose',
    'Congestion',
    'Chest Pain',
    'Weakness In Limbs',
    'Fast Heart Rate',
    'Pain During Bowel Movements',
    'Pain In Anal Region',
    'Bloody Stool',
    'Irritation In Anus',
    'Neck Pain',
    'Dizziness',
    'Cramps',
    'Bruising',
    'Obesity',
    'Swollen Legs',
    'Swollen Blood Vessels',
    'Puffy Face And Eyes',
    'Enlarged Thyroid',
    'Brittle Nails',
    'Swollen Extremeties',
    'Excessive Hunger',
    'Extra Marital Contacts',
    'Drying And Tingling Lips',
    'Slurred Speech',
    'Knee Pain',
    'Hip Joint Pain',
    'Muscle Weakness',
    'Stiff Neck',
    'Swelling Joints',
    'Movement Stiffness',
    'Spinning Movements',
    'Loss Of Balance',
    'Unsteadiness',
    'Weakness Of One Body Side',
    'Loss Of Smell',
    'Bladder Discomfort',
    'Foul Smell Of Urine',
    'Continuous Feel Of Urine',
    'Passage Of Gases',
    'Internal Itching',
    'Toxic Look (typhos)',
    'Depression',
    'Irritability',
    'Muscle Pain',
    'Altered Sensorium',
    'Red Spots Over Body',
    'Belly Pain',
    'Abnormal Menstruation',
    'Dischromic Patches',
    'Watering From Eyes',
    'Increased Appetite',
    'Polyuria',
    'Family History',
    'Mucoid Sputum',
    'Rusty Sputum',
    'Lack Of Concentration',
    'Visual Disturbances',
    'Receiving Blood Transfusion',
    'Receiving Unsterile Injections',
    'Coma',
    'Stomach Bleeding',
    'Distention Of Abdomen',
    'History Of Alcohol Consumption',
    'Fluid Overload',
    'Blood In Sputum',
    'Prominent Veins On Calf',
    'Palpitations',
    'Painful Walking',
    'Pus Filled Pimples',
    'Blackheads',
    'Scurring',
    'Skin Peeling',
    'Silver Like Dusting',
    'Small Dents In Nails',
    'Inflammatory Nails',
    'Blister',
    'Red Sore Around Nose',
    'Yellow Crust Ooze'
  ];

  Map<String, bool> symptomCheckboxes = {};

  Future<void> _predictDisease(BuildContext context) async {
    List<String> symptoms = symptomCheckboxes.keys
        .where((symptom) => symptomCheckboxes[symptom] == true)
        .toList();

    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/predict'),
      body: json.encode({'symptoms': symptoms}),
      headers: {'Content-Type': 'application/json'},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        _disease = json.decode(response.body)['disease'];
        print('Disease name: $_disease');
      });

      // Show the custom disease dialog (you can create a separate method for this)
      showDiseaseDialog(context);
    } else {
      throw Exception('Failed to predict disease');
    }
  }

  void _clearAllSelectedSymptoms() {
    setState(() {
      symptomCheckboxes.updateAll((key, value) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredSymptoms = symptomList
        .where(
            (symptom) => symptom.toLowerCase().contains(_filter.toLowerCase()))
        .toList();
    bool anySymptomSelected =
        symptomCheckboxes.values.any((isSelected) => isSelected);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 2, 119),
          titleSpacing: 20,
          elevation: 0,
          title: BigFont(
            text: 'Predict Your Disease',
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
          actions: [
            GestureDetector(
              child: Image.asset(
                'images/search.png',
                scale: 17.0,
                color: Colors.white,
              ),
              onTap: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isSearching)
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _searchQueryController,
                  decoration: InputDecoration(
                    labelText: 'Search symptoms',
                    hintText: 'Search symptoms',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: filteredSymptoms.map((symptom) {
                    return ChoiceChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 2, 2, 119)),
                      ),
                      label: SmallFont(
                        text: symptom,
                        color: symptomCheckboxes[symptom] ?? false
                            ? Colors.white
                            : Colors.black,
                        size: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: const Color.fromARGB(255, 2, 2, 119),
                      labelStyle: TextStyle(
                          color: symptomCheckboxes[symptom] ?? false
                              ? Colors.white
                              : Colors.black),
                      selected: symptomCheckboxes[symptom] ?? false,
                      onSelected: (bool selected) {
                        setState(() {
                          symptomCheckboxes[symptom] = selected;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            if (anySymptomSelected)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color.fromARGB(255, 2, 2, 119),
                      width: 3,
                    ),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: BigFont(
                              text: 'Your selected symptoms are:',
                              size: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          _buildSelectedSymptoms(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: _clearAllSelectedSymptoms,
                                child: SmallFont(
                                  text: 'Clear All',
                                  color: const Color.fromARGB(255, 2, 2, 119),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _predictDisease(context),
                                child: Container(
                                  height: 40.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color.fromARGB(255, 2, 2, 119),
                                  ),
                                  child: Center(
                                      child: SmallFont(
                                    text: 'Next',
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void showDiseaseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: kBGColor,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigFont(
                  text: "Predicted Disease",
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
                SmallFont(
                  text: _disease!,
                  fontWeight: FontWeight.w600,
                  size: 20,
                  color: const Color.fromARGB(255, 2, 2, 119),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: const Color.fromARGB(255, 2, 2, 119),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: SmallFont(
                    text: 'Close',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectedSymptoms() {
    List<Widget> selectedSymptomChips = symptomCheckboxes.entries
        .where((entry) => entry.value)
        .map((entry) => Chip(
              label: SmallFont(
                text: entry.key,
                color: Colors.white,
                size: 15.0,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: const Color.fromARGB(255, 2, 2, 119),
              //labelStyle: TextStyle(color: Colors.white),
            ))
        .toList();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: selectedSymptomChips,
    );
  }
}
