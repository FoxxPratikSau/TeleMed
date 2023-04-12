import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tele_med/Log_in_page/Intro_log_in.dart';
import 'package:tele_med/widgets/small_font.dart';

import '../widgets/big_font.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.to(sign_in_page());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.greenAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 50,
                          child: Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: Colors.teal,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        big_font(text: "Welcome the virtual World"),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.black,
                          size: 80,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      SmallFont(text: "Going into the world"),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
