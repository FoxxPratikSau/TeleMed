import 'package:flutter/material.dart';
import 'package:tele_med/constants.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_med/widgets/app_preview.dart';
import 'package:get/get.dart';
import 'package:tele_med/essentials/auth_service.dart';

class HomePage extends StatefulWidget {
  final loginController = Get.find<AuthService>();

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    List<String> texts = ["ABCD🤣", "Nitin💯", "Priyansh🔥"];
    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigFont(
                          text:
                              'Morning, ${widget.loginController.returnUserData().name.split(' ')[0]}',
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                        BigFont(
                          text: 'Keep Healthy!',
                          size: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.w800,
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: Image.network(
                              widget.loginController.returnUserData().photoUrl)
                          .image,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: dimensions.size20 * 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(dimensions.size10),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 17),
                              ),
                              hintText: 'Search doctor or anything',
                              prefixIcon: Container(
                                decoration: BoxDecoration(
                                  //color: const Color.fromARGB(255, 29, 60, 146),
                                  borderRadius:
                                      BorderRadius.circular(dimensions.size10),
                                ),
                                child: Image.asset(
                                  'images/search.png',
                                  scale: 17.0,
                                  color: Colors.black,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(dimensions.size10),
                            ),
                            onChanged: (value) {
                              search = value;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          height: dimensions.size20,
                        ),
                        MyPageView(numPages: 3, pageTexts: texts),
                        SizedBox(
                          height: dimensions.size20,
                        ),
                        BigFont(
                          text: 'Features',
                          size: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: dimensions.size5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    print('Symptom Checker');
                                  },
                                  child: PhysicalModel(
                                    elevation: 8.0,
                                    color: Colors.white,
                                    shadowColor: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      padding: const EdgeInsets.all(20.0),
                                      height: 175.0,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            kPrimaryColor,
                                            const Color(0xFF000030),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Symptom Checker',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: kBGColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    print('Medical Imaging');
                                  },
                                  child: PhysicalModel(
                                    elevation: 8.0,
                                    color: Colors.white,
                                    shadowColor: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      height: 175.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            kPrimaryColor,
                                            const Color(0xFF000030),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Medical Imaging',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: kBGColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
