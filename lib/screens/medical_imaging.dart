import 'package:flutter/material.dart';
import 'package:tele_med/components/rounded_button.dart';
import 'package:tele_med/flutter_flow/flutter_flow_theme.dart';
import 'package:tele_med/lung_cancer/Lung_page.dart';
import 'package:tele_med/skin_cancer/sc_page.dart';
import 'package:tele_med/widgets/constants.dart';

class MedicalImaging extends StatelessWidget {
  const MedicalImaging({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Scaffold',
      home: Scaffold(
        backgroundColor: kBGColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntroButton(
                  cHeight: 70.0,
                  // bgColor: FlutterFlowTheme.of(context).primary,
                  bgColor: Colors.blue,
                  title: 'Skin Cancer Detector',
                  onPress: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SkinCancerPage(),
                      ),
                    );
                  }),
                ),
                IntroButton(
                  cHeight: 70.0,
                  // bgColor: FlutterFlowTheme.of(context).secondary,
                  bgColor: Colors.pink,
                  title: 'Lung Cancer Detector',
                  onPress: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LungCancerPage(),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
