// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:tele_med/essentials/firestore_service.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/constants.dart';

import 'package:tele_med/widgets/small_font.dart';

class appointments extends StatefulWidget {
  final int pageID;
  const appointments({Key? key, required this.pageID}) : super(key: key);

  @override
  State<appointments> createState() => _appointmentsState();
}

class _appointmentsState extends State<appointments> {
  final _firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBGColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.3,
                ),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigFont(
                        text: "2 Appointments",
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallFont(
                      text: "Requested",
                      fontWeight: FontWeight.w500,
                    ),
                    SmallFont(
                      text: "Completed",
                      fontWeight: FontWeight.w500,
                    ),
                    SmallFont(
                      text: "Cancelled",
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                  width: double.maxFinite,
                  child: StreamBuilder<QuerySnapshot>(
                    stream:
                        _firestoreService.getDoctorAppointments(widget.pageID),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      return ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var appointment = snapshot.data!.docs[index];
                          // setState(() {
                          //   noOfAppointment = snapshot.data!.docs.length;
                          // });
                          return Stack(
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 180,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.teal.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0,
                                            3), // changes the shadow direction vertically
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15 * 3.5,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.grey,
                                            child: Image.network(
                                              appointment['userImage'],
                                              // fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SmallFont(
                                                text: appointment['userName'],
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(
                                                height: 10 / 3,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      height: 15,
                                                      width: 15,
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.asset(
                                                            "images/stethoscope.png",
                                                          ))),
                                                  SizedBox(
                                                    width: 10 / 3,
                                                  ),
                                                  SmallFont(
                                                    text: "Cold & Cough",
                                                    fontWeight: FontWeight.w500,
                                                    size: 10,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(
                                                    Icons.info,
                                                    size: 15,
                                                    color: Colors.black,
                                                  ),
                                                  SmallFont(
                                                    text: "36 years, Male (O+)",
                                                    fontWeight: FontWeight.w500,
                                                    size: 10,
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 25 + 10 / 1.3,
                                            width: 15 * 4.7,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                        255, 91, 169, 161)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                                child: SmallFont(
                                              text: "Reschedule",
                                              size: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.teal,
                                            )),
                                          ),
                                          Container(
                                            height: 25 + 10 / 1.3,
                                            width: 15 * 4.7,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                        255, 215, 68, 68)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                                child: SmallFont(
                                              text: "Reject",
                                              size: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            )),
                                          ),
                                          Container(
                                            height: 25 + 10 / 1.3,
                                            width: 15 * 4.7,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                        255, 104, 212, 122)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                                child: SmallFont(
                                              text: "Accept",
                                              size: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green,
                                            )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 10 / 1.5),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 132, 203, 203),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  height: 20 * 2.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SmallFont(
                                        text: "Appointment Request!",
                                        color: Colors.teal[900],
                                        fontWeight: FontWeight.w600,
                                        size: 10 + 10 / 5,
                                      ),
                                      SizedBox(
                                        height: 10 / 2,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timelapse,
                                            size: 15,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SmallFont(
                                                text: appointment['date'],
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                size: 10,
                                              ),
                                              SizedBox(
                                                width: 30.0,
                                              ),
                                              SmallFont(
                                                text: appointment['time'],
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                size: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
