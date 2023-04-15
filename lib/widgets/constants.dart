import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kPrimaryColor = const Color.fromARGB(255, 2, 49, 220);
Color kBGColor = const Color.fromARGB(255, 239, 240, 240);

var kMessageTextFieldDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w400,
      fontSize: 15.0,
    ),
  ),
  border: InputBorder.none,
);

var kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kPrimaryColor, width: 2.0),
  ),
);

InputDecoration kTextFieldDecoration = InputDecoration(
  hintText: ' ',
  hintStyle: const TextStyle(color: Colors.grey),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 3.0),
    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
  ),
);
var kSendButtonTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: kPrimaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  ),
);
