// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_med/widgets/constants.dart';

class IntroButton extends StatelessWidget {
  final Function()? onPress;
  final Color bgColor;
  final String title;
  final double cHeight;
  const IntroButton(
      {Key? key,
      required this.onPress,
      required this.bgColor,
      required this.title,
      this.cHeight = 30})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 15.0,
        color: bgColor,
        borderRadius: BorderRadius.circular(15.0),
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                colors: [
                  kPrimaryColor,
                  const Color(0xFF000030),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            height: cHeight,
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
