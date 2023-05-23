// ignore_for_file: use_build_context_synchronously, must_be_immutable, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class doctor_profile extends StatefulWidget {
  final int pageID;

  const doctor_profile({super.key, required this.pageID});

  @override
  State<doctor_profile> createState() => _doctor_profileState();
}

class _doctor_profileState extends State<doctor_profile> {
  bool showSpinner = false;
  List<dynamic> doc = [];

  @override
  void initState() {
    super.initState();
    String jsonData =
        '[ { "id": 1, "name": "Subhash Chandra", "image": "images/doc1.png", "prof": "Cardiologist" }, { "id": 2, "name": "Amit Agarwal", "image": "images/doc2.png", "prof": "Oncologist" }, { "id": 3, "name": "Ritika Malhotra", "image": "images/doc3.png", "prof": "Dentist" }, { "id": 4, "name": "Ashok Vaid", "image": "images/doc4.png", "prof": "Hematologist" }, { "id": 5, "name": "Saurabh Pokhariyal", "image": "images/doc5.png", "prof": "Nephrologist" }, { "id": 6, "name": "Rajiv Anand", "image": "images/doc6.png", "prof": "Neurologist" }, { "id": 7, "name": "Jyotsna Oak", "image": "images/doc7.png", "prof": "Rheumatologist" }, { "id": 8, "name": "Rajesh Ahlawat", "image": "images/doc8.png", "prof": "Urologist" }, { "id": 9, "name": "Vikas Singhal", "image": "images/doc9.png", "prof": "Gastroenterologist" }, { "id": 10, "name": "Samir Parikh", "image": "images/doc10.png", "prof": "Psychiatrist" } ]';
    doc = jsonDecode(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TextButton(
                      onPressed: null,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BigFont(
                            text: 'Profile',
                            size: 32.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child:
                                    Image.asset(doc[widget.pageID]['image'])),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: BigFont(
                              text:
                                  // widget.loginController.returnUserData().name,
                                  'Dr. ${doc[widget.pageID]['name']}',
                              size: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SmallFont(
                                text: doc[widget.pageID]['prof'],
                                color: Colors.grey[700],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Center(
                            child: SmallFont(
                              text: 'AIIMS DELHI',
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                Material(
                                  elevation: 10.0,
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: MaterialButton(
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: () {
                                      Get.snackbar(
                                        '',
                                        '',
                                        animationDuration:
                                            const Duration(seconds: 2),
                                        barBlur: 10.0,
                                        titleText: BigFont(
                                          text: 'Attention',
                                          color: Colors.red,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.bold,
                                          size: 20.0,
                                        ),
                                        messageText:
                                            SmallFont(text: 'Coming Soon!'),
                                      );
                                    },
                                    child: Container(
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black54,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                              'images/purchase_history.png',
                                              height: 40,
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          SmallFont(
                                            text: 'Appointment History',
                                            size: 20.0,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Material(
                                  elevation: 10.0,
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: MaterialButton(
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: (() {
                                      Get.snackbar(
                                        '',
                                        '',
                                        animationDuration:
                                            const Duration(seconds: 2),
                                        barBlur: 10.0,
                                        titleText: BigFont(
                                          text: 'Attention',
                                          color: Colors.red,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.bold,
                                          size: 20.0,
                                        ),
                                        messageText:
                                            SmallFont(text: 'Coming Soon!'),
                                      );
                                    }),
                                    child: Container(
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black54,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                              'images/medical_record.png',
                                              height: 40,
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          SmallFont(
                                            text: 'Certificates',
                                            size: 20.0,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Material(
                                  elevation: 10.0,
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: MaterialButton(
                                    padding: const EdgeInsets.all(0.0),
                                    //minWidth: double.infinity,
                                    onPressed: (() {
                                      Get.snackbar(
                                        '',
                                        '',
                                        animationDuration:
                                            const Duration(seconds: 2),
                                        barBlur: 10.0,
                                        titleText: BigFont(
                                          text: 'Attention',
                                          color: Colors.red,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.bold,
                                          size: 20.0,
                                        ),
                                        messageText:
                                            SmallFont(text: 'Coming Soon!'),
                                      );
                                    }),
                                    child: Container(
                                      height: 60.0,
                                      //width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black54,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                              'images/info.png',
                                              height: 40,
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          SmallFont(
                                            text: 'Other Info',
                                            size: 20.0,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Center(
                                  child: Material(
                                    elevation: 8.0,
                                    //color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.pop(context);
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             IntroPage()));
                                      },
                                      //splashColor: Colors.black,

                                      // onTap: () async {
                                      //   setState(() {
                                      //     showSpinner = true;
                                      //   });
                                      //   //await widget.loginController.signOut();
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           const SignIn(),
                                      //     ),
                                      //   );
                                      //   setState(() {
                                      //     showSpinner = false;
                                      //   });
                                      // },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 45.0),
                                        height: 60.0,
                                        width: 250.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              kPrimaryColor,
                                              const Color(0xFF000030),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Image.asset(
                                                'images/logout.png',
                                                height: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(width: 10.0),
                                            SmallFont(
                                              text: 'LOG OUT',
                                              color: Colors.white,
                                              size: 20.0,
                                              fontWeight: FontWeight.bold,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
