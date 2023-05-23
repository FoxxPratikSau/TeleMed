// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tele_med/components/rounded_button.dart';
import 'package:tele_med/flutter_flow/flutter_flow_theme.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/screens/initiate_app.dart';
import '../widgets/big_font.dart';
import '../widgets/small_font.dart';
import 'package:tele_med/components/textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tele_med/essentials/auth_service.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameController = TextEditingController();
  final loginController = Get.put(AuthService());
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final passwordController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";
  String phone = "";
  String confirmPassword = "";
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Material(
            color: kBGColor,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Create Account',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Recoleta',
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                            fontSize: 30,
                            color: FlutterFlowTheme.of(context).quaternary,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 50, top: 20, left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.person_2_outlined,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomTextField(
                                onChanged: (value) {
                                  name = value;
                                  setState(() {});
                                },
                                fieldController: nameController,
                                labelledText: 'NAME',
                                title: name,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomTextField(
                                onChanged: (value) {
                                  email = value;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.emailAddress,
                                fieldController: emailController,
                                labelledText: 'EMAIL',
                                title: email,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone_android_outlined,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomTextField(
                                onChanged: (value) {
                                  phone = value;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.phone,
                                fieldController: phoneController,
                                labelledText: 'PHONE',
                                title: phone,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.lock_open_outlined,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomTextField(
                                onChanged: (value) {
                                  password = value;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.visiblePassword,
                                fieldController: passwordController,
                                labelledText: 'PASSWORD',
                                title: password,
                                obscureTextC: true,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.lock_outline,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomTextField(
                                onChanged: (value) {
                                  confirmPassword = value;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.visiblePassword,
                                fieldController: confirmpasswordController,
                                labelledText: 'CONFIRM PASSWORD',
                                title: confirmPassword,
                                obscureTextC: true,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          IntroButton(
                            onPress: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                List<String> signInMethods = await auth
                                    .fetchSignInMethodsForEmail(email);
                                if (signInMethods.isNotEmpty) {
                                  Get.snackbar(
                                    '',
                                    '',
                                    animationDuration:
                                        const Duration(seconds: 2),
                                    barBlur: 5.0,
                                    titleText: BigFont(
                                      text: 'Attention',
                                      color: Colors.red,
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.bold,
                                      size: 20.0,
                                    ),
                                    messageText: SmallFont(
                                        text:
                                            'The email address is already in use by another account.'),
                                  );
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  return;
                                }
                                if (password == confirmPassword) {
                                  if (phone.length == 10) {
                                    await auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                    Get.snackbar(
                                      '',
                                      '',
                                      animationDuration:
                                          const Duration(seconds: 2),
                                      barBlur: 5.0,
                                      titleText: BigFont(
                                        text: 'Account Created',
                                        color: Colors.red,
                                        textAlign: TextAlign.left,
                                        fontWeight: FontWeight.bold,
                                        size: 20.0,
                                      ),
                                      messageText: SmallFont(
                                          text: 'Will be available soon.'),
                                    );
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  } else {
                                    Get.snackbar(
                                      '',
                                      '',
                                      animationDuration:
                                          const Duration(seconds: 2),
                                      barBlur: 5.0,
                                      titleText: BigFont(
                                        text: 'Attention',
                                        color: Colors.red,
                                        textAlign: TextAlign.left,
                                        fontWeight: FontWeight.bold,
                                        size: 20.0,
                                      ),
                                      messageText: SmallFont(
                                          text: 'Enter a valid Phone number.'),
                                    );
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  }
                                } else {
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
                                    messageText: SmallFont(
                                        text: 'Passwords does not match.'),
                                  );
                                  setState(() {
                                    showSpinner = false;
                                  });
                                }
                              } catch (e) {
                                print(e);
                                setState(() {
                                  showSpinner = false;
                                });
                              }
                              emailController.clear();
                              passwordController.clear();
                              nameController.clear();
                              phoneController.clear();
                              confirmpasswordController.clear();
                            },
                            bgColor: FlutterFlowTheme.of(context).primary,
                            title: 'CREATE ACCOUNT',
                            cHeight: 60.0,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SmallFont(
                                text: "Already have an account? ",
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.pop(context);
                                }),
                                child: SmallFont(
                                  text: "Login",
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            width: double.maxFinite,
                            color: kBGColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed: () async {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    final UserCredential? userCredential =
                                        await loginController
                                            .signInWithGoogle();
                                    try {
                                      if (userCredential != null) {
                                        // final User user = userCredential.user!;
                                        // final userData = UserData(
                                        //   email: user.email.toString(),
                                        //   name: user.displayName.toString(),
                                        //   photoUrl: user.photoURL.toString(),
                                        // );
                                        Get.snackbar(
                                          '',
                                          '',
                                          animationDuration:
                                              const Duration(seconds: 1),
                                          barBlur: 5.0,
                                          titleText: BigFont(
                                            text: 'Successfull',
                                            color: Colors.red,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.bold,
                                            size: 20.0,
                                          ),
                                          messageText: SmallFont(
                                              text:
                                                  'You have successfully created an account.'),
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                InitiatePage(),
                                          ),
                                        );
                                        setState(() {
                                          showSpinner = false;
                                        });
                                      } else {
                                        print(
                                            'User cancelled the sign-in/sign-up flow');
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  child: Image.asset("images/google_logo.png",
                                      color: FlutterFlowTheme.of(context)
                                          .quaternary),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                MaterialButton(
                                  onPressed: null,
                                  child: Image.asset("images/facebook_logo.png",
                                      color: FlutterFlowTheme.of(context)
                                          .quaternary),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                MaterialButton(
                                  onPressed: null,
                                  child: Image.asset("images/twitter_logo.png",
                                      color: FlutterFlowTheme.of(context)
                                          .quaternary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
