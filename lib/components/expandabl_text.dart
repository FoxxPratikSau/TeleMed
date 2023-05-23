// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_med/flutter_flow/flutter_flow_theme.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  FontWeight? fontWeight;
  Color? color;
  double size;

  ExpandableText(
      {super.key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.size = 15,
      this.fontWeight = FontWeight.bold});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.text;
    controller.addListener(() {
      setState(() {
        isExpanded = (controller.text != widget.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      behavior: HitTestBehavior.translucent,
      // child: Text(
      //   style: GoogleFonts.poppins(
      //     textStyle: TextStyle(
      //       color: widget.color,
      //       fontWeight: widget.fontWeight,
      //       fontSize: widget.size,
      //     ),
      //   ),
      //   controller.text,
      //   maxLines: isExpanded ? null : 3,
      //   overflow: TextOverflow.fade,
      // ),
      child: Text(
        controller.text,
        overflow: TextOverflow.fade,
        maxLines: isExpanded ? null : 3,
        style: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'Urbanist',
              fontSize: widget.size,
              color: const Color(0xFF585858),
              letterSpacing: 0.6,
              fontWeight: FontWeight.w600,
              lineHeight: 1.2,
            ),
      ),
    );
  }
}
