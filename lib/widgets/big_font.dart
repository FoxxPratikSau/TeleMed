// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BigFont extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigFont(
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
        fontWeight: FontWeight.w900,
        fontFamily: 'ROBOTO',
        fontSize: size,
      ),
    );
  }
}
