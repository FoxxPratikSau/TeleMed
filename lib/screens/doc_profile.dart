// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_med/screens/audio_call.dart';
import 'package:tele_med/screens/chat_screen.dart';
import 'package:tele_med/screens/video_call.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:intl/intl.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';
import 'package:tele_med/components/expandabl_text.dart';

class DocProfilePage extends StatefulWidget {
  final int pageId;
  const DocProfilePage({super.key, required this.pageId});

  @override
  State<DocProfilePage> createState() => _DocProfilePageState();
}

class _DocProfilePageState extends State<DocProfilePage> {
  int selectedIndex = -1;
  Map<String, bool> hoursCheckBoxes = {};
  bool isTapped = false;

  String _filter = '';
  List<String> hours = [
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM"
  ];
  Widget buildTimeslotView(bool isTap, List<String> filteredHours) {
    if (isTap) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 4,
          runSpacing: 4,
          children: filteredHours.map((hour) {
            return ChoiceChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: kPrimaryColor, width: 1.5),
              ),
              label: SmallFont(
                text: hour,
                color: hoursCheckBoxes[hour] ?? false
                    ? Colors.white
                    : Colors.black,
                size: 15.0,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: Colors.white,
              selectedColor: kPrimaryColor,
              labelStyle: TextStyle(
                  color: hoursCheckBoxes[hour] ?? false
                      ? Colors.white
                      : Colors.black),
              selected: hoursCheckBoxes[hour] ?? false,
              onSelected: (bool selected) {
                // selected = !selected;
                setState(() {
                  hoursCheckBoxes[hour] = selected;
                });
              },
            );
          }).toList(),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var product = Get.find<doctorList_controller>().doctorlist[widget.pageId];
    List<String> filteredHours = hours
        .where((hour) => hour.toLowerCase().contains(_filter.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 30.0,
                      color: kPrimaryColor,
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
                                product.image!,
                                height: 150.0,
                                width: 150.0,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Image.asset(product.image!),
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
                            text: product.prof!,
                            color: Colors.grey.shade600,
                            size: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: BigFont(
                            text: product.name!,
                            size: 25.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60.0,
                            vertical: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatScreen(
                                        pageId: widget.pageId,
                                      ),
                                    ),
                                  );
                                },
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
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AudioCallScreen(
                                        pageId: widget.pageId,
                                      ),
                                    ),
                                  );
                                },
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
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VideoCallScreen(
                                        pageId: widget.pageId,
                                      ),
                                    ),
                                  );
                                },
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
                          text: product.about!,
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
                                final DateFormat dFormatter = DateFormat('dd');
                                final String formattedDate =
                                    dFormatter.format(date);
                                final String day = DateFormat('E').format(date);
                                final isSelected = selectedIndex == index;
                                isTapped = !selectedIndex.isNegative;

                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
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
                        buildTimeslotView(isTapped, filteredHours),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: Material(
                            elevation: 8.0,
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(15.0),
                            child: GestureDetector(
                              onTap: () {
                                if (selectedIndex.isNegative) {
                                  Get.snackbar(
                                    '',
                                    '',
                                    animationDuration:
                                        const Duration(seconds: 2),
                                    barBlur: 10.0,
                                    titleText: BigFont(
                                      text: 'Warning',
                                      color: Colors.red,
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.bold,
                                      size: 20.0,
                                    ),
                                    messageText:
                                        SmallFont(text: 'Select a date first.'),
                                  );
                                } else {
                                  Get.snackbar(
                                    '',
                                    '',
                                    animationDuration:
                                        const Duration(seconds: 2),
                                    barBlur: 10.0,
                                    titleText: BigFont(
                                      text: 'Successful',
                                      color: Colors.red,
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.bold,
                                      size: 20.0,
                                    ),
                                    messageText: SmallFont(
                                        text:
                                            'Appointment Booked Successfully.'),
                                  );
                                  Navigator.pop(context);
                                }
                              },
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
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
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
