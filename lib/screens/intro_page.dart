import 'package:flutter/material.dart';
import 'package:tele_med/constants.dart';
import 'package:tele_med/components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tele_med/screens/signup_page.dart';
import 'package:tele_med/symptoms1/symptoms_flask.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                          textStyle: const TextStyle(
                            color: Colors.black87,
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
                  bgColor: kPrimaryColor,
                  title: 'Continue as User',
                  onPress: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                flex: 2,
                child: IntroButton(
                  bgColor: kPrimaryColor,
                  title: 'Continue as Doctor',
                  onPress: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SymptomChecker(),
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
