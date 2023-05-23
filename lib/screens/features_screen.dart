import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tele_med/flutter_flow/flutter_flow_theme.dart';
import 'package:tele_med/screens/medical_imaging.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/widgets/big_font.dart';
// import 'package:tele_med/widgets/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_med/widgets/app_preview.dart';
import 'package:get/get.dart';
import 'package:tele_med/essentials/auth_service.dart';
import 'package:tele_med/symptoms1/symptoms_flask.dart';
import 'package:tele_med/widgets/small_font.dart';

class FeaturesScreen extends StatefulWidget {
  final loginController = Get.find<AuthService>();

  FeaturesScreen({super.key});

  @override
  State<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  List<dynamic> data = [];
  bool isTyping = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "images/1.png",
      "images/2.png",
      "images/3.png",
      "images/4.png",
      "images/5.png"
    ];

    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
          child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' Features',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Recoleta',
                      fontSize: 40.0,
                      color: FlutterFlowTheme.of(context).quaternary,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
                    ),
              ),
              SizedBox(
                height: 30,
              ),
              MyPageView(numPages: images.length, pageImages: images),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SymptomChecker(),
                            ),
                          );
                        },
                        child: PhysicalModel(
                          elevation: 0.0,
                          color: Colors.white,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            height: 175.0,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                            child: Center(
                              child: Text(
                                'Symptom Checker',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Recoleta',
                                      fontSize: 20.0,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MedicalImaging()));
                        },
                        child: PhysicalModel(
                          elevation: 0.0,
                          color: Colors.white,
                          shadowColor: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 175.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Center(
                              child: Text(
                                'Medical Imaging',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Recoleta',
                                      fontSize: 20.0,
                                      color: FlutterFlowTheme.of(context)
                                          .quaternary,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
