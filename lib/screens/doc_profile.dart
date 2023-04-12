// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tele_med/constants.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:intl/intl.dart';
import 'package:tele_med/components/expandabl_text.dart';

class DocProfilePage extends StatefulWidget {
  const DocProfilePage({super.key});

  @override
  State<DocProfilePage> createState() => _DocProfilePageState();
}

class _DocProfilePageState extends State<DocProfilePage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: GestureDetector(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60.0),
                              child: Image.asset(
                                'images/sampleProfile.jpg',
                                height: 150.0,
                                width: 150.0,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child:
                                        Image.asset('images/sampleProfile.jpg'),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Center(
                          child: SmallFont(
                            text: 'Neurologist',
                            color: Colors.grey.shade600,
                            size: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: BigFont(
                            text: 'Dr. Nitin Chandra Sahu',
                            size: 25.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60.0, vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: PhysicalModel(
                                  elevation: 8.0,
                                  color: Colors.white,
                                  shadowColor: kPrimaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(28),
                                  ),
                                  child: Container(
                                    height: 65.0,
                                    width: 65.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kPrimaryColor,
                                        width: 2.5,
                                      ),
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: Image.asset(
                                      'images/chat_solid.png',
                                      color: kPrimaryColor,
                                      scale: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: PhysicalModel(
                                  elevation: 8.0,
                                  color: Colors.white,
                                  shadowColor: kPrimaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(28),
                                  ),
                                  child: Container(
                                    height: 65.0,
                                    width: 65.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kPrimaryColor,
                                        width: 2.5,
                                      ),
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: Image.asset(
                                      'images/call_phone.png',
                                      color: kPrimaryColor,
                                      scale: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: PhysicalModel(
                                  elevation: 8.0,
                                  color: Colors.white,
                                  shadowColor: kPrimaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(28),
                                  ),
                                  child: Container(
                                    height: 65.0,
                                    width: 65.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kPrimaryColor,
                                        width: 2.5,
                                      ),
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: Image.asset(
                                      'images/videocall.png',
                                      color: kPrimaryColor,
                                      scale: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        BigFont(
                          text: 'About',
                          textAlign: TextAlign.left,
                          size: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ExpandableText(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                          text:
                              'Dr. Nitin Chandra Sahu is a Neurologist in Bhubaneswar and completed his graduation in AIIMS Delhi. He is a proficient and an honest doctor helping people to cure. ',
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        BigFont(
                          text: 'Book Appointment',
                          size: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 80.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              7,
                              (index) {
                                final date =
                                    DateTime.now().add(Duration(days: index));
                                final DateFormat formatter = DateFormat('dd');
                                final String formattedDate =
                                    formatter.format(date);
                                final String day = DateFormat('E').format(date);
                                final isSelected = selectedIndex == index;

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: PhysicalModel(
                                      elevation: isSelected ? 5.0 : 2.0,
                                      color: Colors.white,
                                      shadowColor: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          border: isSelected
                                              ? null
                                              : Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 189),
                                                  width: 1.5,
                                                ),
                                          gradient: isSelected
                                              ? LinearGradient(
                                                  colors: [
                                                    kPrimaryColor,
                                                    const Color.fromARGB(
                                                        255, 0, 0, 189),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                )
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: isSelected
                                              ? kPrimaryColor
                                              : Colors.grey[100],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SmallFont(
                                              text: formattedDate,
                                              size: 18,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                            SmallFont(
                                              text: day,
                                              size: 18,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black54,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: Material(
                            elevation: 8.0,
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(15.0),
                            child: GestureDetector(
                              onTap: () => print('Book'),
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
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: BigFont(
                                    text: 'BOOK',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
