// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tele_med/flutter_flow/flutter_flow_theme.dart';

class SmallFont extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  FontWeight? fontWeight;

  SmallFont(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 15,
      this.height = 1.4,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FlutterFlowTheme.of(context).bodySmall.override(
            color: color,
            fontWeight: fontWeight,
            fontSize: size,
            fontFamily: 'Urbanist',
            // height: height,
            // overflow: null,
          ),
    );
  }
}
