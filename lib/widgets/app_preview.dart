// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:tele_med/constants.dart';

class MyPageView extends StatefulWidget {
  final int numPages;
  final List<String> pageTexts;
  const MyPageView(
      {super.key, required this.numPages, required this.pageTexts});

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _controller = PageController();
  var _currentPageValue = 0.0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPageValue = _controller.page!;
      });
    });
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPageValue < widget.numPages - 1) {
        _currentPageValue += 1.0;
      } else {
        _currentPageValue = 0;
      }
      if (_controller.hasClients) {
        _controller.animateToPage(
          _currentPageValue.toInt(),
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kPrimaryColor,
                const Color(0xFF000030),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          height: 250.0,
          child: PageView(
            controller: _controller,
            children: List.generate(
              widget.numPages,
              (index) => Container(
                margin: const EdgeInsets.only(
                    top: 50.0, bottom: 15.0, left: 15.0, right: 70.0),
                child: Text(
                  widget.pageTexts[index],
                  style: GoogleFonts.righteous(
                    textStyle: TextStyle(
                      color: kBGColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        DotsIndicator(
          dotsCount: widget.numPages,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: kPrimaryColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
