import 'package:flutter/material.dart';
import 'package:tele_med/flutter_flow/flutter_flow_theme.dart';
import 'package:tele_med/screens/doctor_screens/doctor_login.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tele_med/screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0, left: 30, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 11,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/TelemedLogo.png', scale: 2.2),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 213.0,
                      child: DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rammettoOne(
                          textStyle: TextStyle(
                            color: FlutterFlowTheme.of(context).quaternary,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'TeleMed',
                              speed: const Duration(milliseconds: 110),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: IntroButton(
                  bgColor: FlutterFlowTheme.of(context).primary,
                  title: 'Continue as User',
                  onPress: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                flex: 2,
                child: IntroButton(
                  bgColor: FlutterFlowTheme.of(context).secondary,
                  title: 'Continue as Doctor',
                  onPress: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoctorLogin(),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
