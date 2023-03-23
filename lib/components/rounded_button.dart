// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final Function()? onPress;
  final Color bgColor;
  final String title;
  const IntroButton(
      {Key? key,
      required this.onPress,
      required this.bgColor,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 15.0,
        color: bgColor,
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 30.0,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
