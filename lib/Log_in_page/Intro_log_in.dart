import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'package:tele_med/Log_in_page/log_in_doctor.dart';

import '../widgets/big_font.dart';
import '../widgets/small_font.dart';
import '../widgets/dimensions.dart';

class sign_in_page extends StatefulWidget {
  const sign_in_page({super.key});

  @override
  State<sign_in_page> createState() => _sign_in_pageState();
}

class _sign_in_pageState extends State<sign_in_page> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String email = "";
  String password = "";

  bool change = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(255, 255, 255, 255),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [
              SizedBox(
                height: dimensions.size260,
              ),
              big_font(
                text: "Welcome Back",
                size: 35,
                color: Colors.teal,
              ),
              SizedBox(
                height: 5,
              ),
              small_font(text: "Sign in to Continue"),
              SizedBox(
                height: dimensions.size20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 35,
                      ),
                      SizedBox(
                        width: dimensions.size10 / 2,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.teal),
                                borderRadius: BorderRadius.circular(15),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "email can't be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_open_outlined,
                        size: 35,
                      ),
                      SizedBox(
                        width: dimensions.size10 / 2,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.teal),
                                borderRadius: BorderRadius.circular(15),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password can't be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      small_font(
                        text: "Forgot Password?",
                        color: Colors.teal,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimensions.size20,
                  ),
                  Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(dimensions.size20)),
                          color: Colors.teal),
                      child: GestureDetector(
                        onTap: () {
                          // googleLogin();
                          //Get.toNamed(RouteHelper.initial);
                        },
                        child: Center(
                          child: big_font(
                            text: "LOG IN",
                            color: Colors.white,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: dimensions.size20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      small_font(text: "Don't have account?"),
                      GestureDetector(
                        //onTap: () => Get.toNamed(RouteHelper.getlogin()),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(sign_up_page());
                          },
                          child: small_font(
                            text: " Create a new account",
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              )
            ]),
          ),
        ));
  }
}
