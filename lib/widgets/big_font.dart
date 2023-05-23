import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class big_font extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  big_font(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: 'ROBOTO',
        fontSize: size,
      ),
    );
  }
}
// ignore_for_file: must_be_immutable

class BigFont extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  BigFont(
      {super.key,
      this.color = Colors.black87,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 20,
      this.fontWeight = FontWeight.w900,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 1,
      overflow: overflow,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: size,
        ),
      ),
    );
  }
}
