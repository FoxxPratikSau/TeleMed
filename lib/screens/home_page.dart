import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tele_med/screens/doc_profile.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_med/widgets/app_preview.dart';
import 'package:get/get.dart';
import 'package:tele_med/essentials/auth_service.dart';
import 'package:tele_med/symptoms1/symptoms_flask.dart';
import 'package:tele_med/widgets/small_font.dart';

class HomePage extends StatefulWidget {
  final loginController = Get.find<AuthService>();

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data = [];
  bool isTyping = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    String jsonData =
        '[{"name": "Subhash Chandra","prof": "Cardiologist"},{"name": "Amit Agarwal","prof": "Oncologist"},{"name": "Ritika Malhotra","prof": "Dentist"},{"name": "Ashok Vaid","prof": "Hematologist"},{"name": "Saurabh Pokhariyal","prof": "Nephrologist"},{"name": "Rajiv Anand","prof": "Neurologist"},{"name": "Jyotsna Oak","prof": "Rheumatologist"},{"name": "Rajesh Ahlawat","prof": "Urologist"},{"name": "Vikas Singhal","prof": "Gastroenterologist"},{"name": "Samir Parikh","prof": "Psychiatrist"}]';
    data = jsonDecode(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "images/1.png",
      "images/2.png",
      "images/3.png",
      "images/4.png",
      "images/5.png"
    ];
    String checkTime() {
      final hour = DateTime.now().hour;
      if (hour >= 0 && hour < 12) {
        return 'Morning,';
      } else if (hour >= 12 && hour < 18) {
        return 'Afternoon,';
      } else {
        return 'Evening,';
      }
    }

    Widget changeWidget(bool isTyping) {
      if (isTyping) {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              if (data[index]['name']
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()) ||
                  data[index]['prof']
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase())) {
                return ListTile(
                  title: BigFont(
                    text: data[index]['name'],
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                  subtitle: SmallFont(
                    text: data[index]['prof'],
                    fontWeight: FontWeight.w500,
                  ),
                  onTap: () {
                    // Navigate to another page when the ListTile is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DocProfilePage(pageId: index),
                      ),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        );
      } else {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                MyPageView(numPages: images.length, pageImages: images),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SymptomChecker(),
                              ),
                            );
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
            ),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigFont(
                        text:
                            '${checkTime()} ${widget.loginController.returnUserData().name.split(' ')[0]}',
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: dimensions.size20 * 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(dimensions.size10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 17),
                              ),
                              hintText: 'Search Doctor or by Profession',
                              prefixIcon: Container(
                                decoration: BoxDecoration(
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
                              setState(() {
                                isTyping = true;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: dimensions.size15),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: changeWidget(isTyping),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
