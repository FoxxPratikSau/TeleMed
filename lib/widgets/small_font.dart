import 'dart:ui';

import 'package:flutter/material.dart';

class small_font extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;

  small_font(
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
          fontFamily: 'ROBOTO',
          fontSize: size,
          height: height,
          overflow: null),
    );
  }
}
