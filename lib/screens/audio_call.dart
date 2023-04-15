// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';

class AudioCallScreen extends StatefulWidget {
  final int pageId;
  const AudioCallScreen({Key? key, required this.pageId}) : super(key: key);

  @override
  _AudioCallScreenState createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  bool _isMuted = false;
  bool _isSpeakerOn = false;

  @override
  Widget build(BuildContext context) {
    var product = Get.find<doctorList_controller>().doctorlist[widget.pageId];
    return Scaffold(
      appBar: AppBar(
        shadowColor: kPrimaryColor,
        elevation: 20.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/call_phone.png',
                  color: Colors.white, height: 30.0),
              BigFont(
                text: 'Dr. ${product.name!}',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black,
                child: Image.asset(
                  product.image!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomAppBar(
                notchMargin: 8,
                height: 70.0,
                color: Colors.transparent,
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(153, 0, 0, 0),
                      blurRadius: 50,
                      spreadRadius: 2,
                    )
                  ]),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        iconSize: 30.0,
                        onPressed: () {
                          setState(() {
                            _isMuted = !_isMuted;
                          });
                        },
                        icon: Icon(
                          _isMuted ? Icons.mic_off : Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        iconSize: 30.0,
                        onPressed: () {
                          setState(() {
                            _isSpeakerOn = !_isSpeakerOn;
                          });
                        },
                        icon: Icon(
                          _isSpeakerOn ? Icons.volume_up : Icons.volume_mute,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 30.0,
                        child: Center(
                          child: IconButton(
                            iconSize: 30.0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.call_end,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
