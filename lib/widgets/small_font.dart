// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SmallFont extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;

  SmallFont(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 15,
      this.height = 1.4});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //overflow: overflow,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontFamily: 'ROBOTO',
          fontSize: size,
          height: height,
          overflow: null),
    );
  }
}
