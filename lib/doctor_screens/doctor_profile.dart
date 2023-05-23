// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tele_med/essentials/auth_service.dart';
import 'package:tele_med/screens/login_page.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class doctor_profile extends StatefulWidget {
  // final loginController = Get.find<AuthService>();
  doctor_profile({super.key});

  @override
  State<doctor_profile> createState() => _doctor_profileState();
}

class _doctor_profileState extends State<doctor_profile> {
  bool showSpinner = false;

void showBillBottomSheet(double amount) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: Color.fromARGB(255, 161, 197, 226),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Appointment Bill',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Appointment Charge -',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '\₹${amount.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CGST -',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '\₹ 11.25',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SGST -',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '\₹ 11.25',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "------------------------------------------------------",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount -',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        '\₹${(amount + 22.50).toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kPrimaryColor,
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Add your logic for payment handling
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kPrimaryColor,
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Add your logic for declining the payment
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Decline',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
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
                            child: Container(
                              height: dimensions.size100,
                              width: dimensions.size100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: kPrimaryColor,
                                  width: 5,
                                ),
                                shape: BoxShape.rectangle,
                                // image: DecorationImage(
                                //   fit: BoxFit.cover,
                                //   image: NetworkImage(
                                //     widget.loginController
                                //         .returnUserData()
                                //         .photoUrl,
                                //   ),
                                // ),
                                
                              ),
                              child: Icon(Icons.person,size: dimensions.size25*2,),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: BigFont(
                              text:
                                  // widget.loginController.returnUserData().name,
                                  "Dibya Ranjan Sahu",
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
                                text: 'Cardiologist',
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
                                      onTap: (){
                                        double billAmount = 100.0; // Replace with your desired amount
    showBillBottomSheet(billAmount);
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
                height: dimensions.size25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
