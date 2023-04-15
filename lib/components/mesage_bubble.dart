// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/widgets/small_font.dart';

class MessageBubble extends StatelessWidget {
  late String text;
  MessageBubble({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Material(
            elevation: 10.0,
            color: kPrimaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: SmallFont(
                text: text,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
