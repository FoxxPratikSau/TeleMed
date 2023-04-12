import 'package:flutter/material.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:tele_med/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
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
                          size: 40.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
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
                          child: BigFont(
                            text: 'Nitin Chandra Sahu',
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
                              text: 'MALE',
                              color: Colors.grey[700],
                            ),
                            SmallFont(
                              text: 'AGE: 25',
                              color: Colors.grey[700],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [
                              Material(
                                elevation: 10.0,
                                borderRadius: BorderRadius.circular(15.0),
                                child: GestureDetector(
                                  onTap: () => print('Tapped'),
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
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
                                          text: 'Purchase History',
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
                                child: GestureDetector(
                                  onTap: () => print('Tapped'),
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
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
                                          text: 'Medical Record',
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
                                child: GestureDetector(
                                  onTap: () => print('Tapped'),
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
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
                                          text: 'Appointments Info',
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
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: GestureDetector(
                                    onTap: () => print('Log Out'),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 45.0),
                                      height: 60.0,
                                      width: 250.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
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
            )
          ],
        ),
      ),
    );
  }
}
