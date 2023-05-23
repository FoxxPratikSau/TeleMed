// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/camera_control.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';

class VideoCallScreen extends StatefulWidget {
  final int pageId;
  const VideoCallScreen({Key? key, required this.pageId}) : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  CameraController? _cameraController;
  CameraDescription? selectedCamera;
  Future<void>? _initCameraControllerFuture;
  List<CameraDescription>? cameras;
  final cameraControl = Get.find<CameraControl>();

  bool _isCameraOn = false;
  bool _isMuted = false;
  bool _isSpeakerOn = false;

  @override
  void initState() {
    super.initState();
    _initCameraController();
  }

  Future<void> _initCameraController() async {
    final List<CameraDescription> cameras =
        await cameraControl.returnCameraDescriptionList();
    final firstCamera = cameras.first;
    _cameraController = CameraController(firstCamera, ResolutionPreset.high);
    _initCameraControllerFuture = _cameraController!.initialize();
    setState(() {
      this.cameras = cameras;
    });
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var product = Get.find<doctorList_controller>().doctorlist[widget.pageId];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/videocall.png',
                color: Colors.blue, height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: BigFont(
                text: 'Dr. ${product.name!}',
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              Positioned.fill(
                left: 250,
                right: 10,
                bottom: 85.0,
                top: 475,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: FutureBuilder<void>(
                              future: _initCameraControllerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return CameraPreview(_cameraController!);
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: FutureBuilder<void>(
                      future: _initCameraControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return CameraPreview(_cameraController!);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(153, 0, 0, 0),
                        blurRadius: 50,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
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
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          iconSize: 30.0,
                          onPressed: () {
                            setState(() {
                              selectedCamera = selectedCamera == cameras!.first
                                  ? cameras!.last
                                  : cameras!.first;
                              _initCameraController();
                            });
                          },
                          icon: Icon(
                            Icons.switch_camera,
                            color: Colors.blue,
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
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          iconSize: 30.0,
                          onPressed: () {
                            setState(() {
                              _isCameraOn = !_isCameraOn;
                              if (_isCameraOn) {
                                _cameraController!.startImageStream((image) {
                                  // Do something with the camera image
                                });
                              } else {
                                _cameraController!.stopImageStream();
                              }
                            });
                          },
                          icon: Icon(
                            _isCameraOn ? Icons.videocam : Icons.videocam_off,
                            color: Colors.blue,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 30.0,
                          child: IconButton(
                            iconSize: 30.0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.call_end,
                              color: Colors.white,
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
      ),
    );
  }
}
