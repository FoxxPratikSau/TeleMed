// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:tele_med/components/rounded_button.dart';
import 'package:tele_med/components/textfield.dart';
import 'package:tele_med/flutter_flow/flutter_flow_theme.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/screens/initiate_app.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:tele_med/screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tele_med/essentials/auth_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final loginController = Get.put(AuthService());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool change = false;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'images/profile_solid.png',
                      scale: 3,
                      color: Colors.black26,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome Back',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Recoleta',
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                            fontSize: 35,
                            color: FlutterFlowTheme.of(context).quaternary,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SmallFont(
                      text: "Sign in to Continue",
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SmallFont(
                                text: "Forgot Password?",
                                color: FlutterFlowTheme.of(context).primaryText,
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
                                await auth.signInWithEmailAndPassword(
                                    email: email, password: password);
                                Get.snackbar(
                                  '',
                                  '',
                                  animationDuration: const Duration(seconds: 1),
                                  barBlur: 5.0,
                                  titleText: BigFont(
                                    text: 'Login Successfull',
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
                                //Change screen to main Screen and use Name and Default image from firestore.
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
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
                                            'User not Found, Create an Account.'),
                                  );
                                  setState(
                                    () {
                                      showSpinner = false;
                                    },
                                  );
                                } else if (e.code == 'wrong-password') {
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
                                    messageText:
                                        SmallFont(text: 'Wrong Password.'),
                                  );
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                print(e);
                                setState(() {
                                  showSpinner = false;
                                });
                              }
                              emailController.clear();
                              passwordController.clear();
                            },
                            bgColor: FlutterFlowTheme.of(context).primary,
                            title: 'LOGIN',
                            cHeight: 60.0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Colors.grey,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Signup(),
                                    ),
                                  );
                                }),
                                child: Text(
                                  'Create an account',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: Colors.red,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      //margin: const EdgeInsets.only(bottom: 20.0),
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
                                  await loginController.signInWithGoogle();
                              try {
                                if (userCredential != null) {
                                  // final User user = userCredential.user!;
                                  // final userData = Get.put(UserData(
                                  //   email: user.email.toString(),
                                  //   name: user.displayName.toString(),
                                  //   photoUrl: user.photoURL.toString(),
                                  // ));
                                  // Get.snackbar(
                                  //   '',
                                  //   '',
                                  //   animationDuration:
                                  //       const Duration(seconds: 1),
                                  //   barBlur: 5.0,
                                  //   titleText: BigFont(
                                  //     text: 'Successfull',
                                  //     color: Colors.red,
                                  //     textAlign: TextAlign.left,
                                  //     fontWeight: FontWeight.bold,
                                  //     size: 20.0,
                                  //   ),
                                  //   messageText: SmallFont(
                                  //       text: 'Logged In successfully.'),
                                  // );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InitiatePage(),
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
                                color: FlutterFlowTheme.of(context).quaternary),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          MaterialButton(
                            onPressed: null,
                            child: Image.asset("images/facebook_logo.png",
                                color: FlutterFlowTheme.of(context).quaternary),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          MaterialButton(
                            onPressed: null,
                            child: Image.asset("images/twitter_logo.png",
                                color: FlutterFlowTheme.of(context).quaternary),
                          ),
                        ],
                      ),
                    ),
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
