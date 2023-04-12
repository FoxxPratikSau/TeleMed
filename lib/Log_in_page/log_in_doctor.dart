import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tele_med/Log_in_page/Intro_log_in.dart';


import '../widgets/big_font.dart';
import '../widgets/small_font.dart';
import '../widgets/dimensions.dart';

class sign_up_page extends StatefulWidget {
  const sign_up_page({super.key});

  @override
  State<sign_up_page> createState() => _sign_up_pageState();
}

class _sign_up_pageState extends State<sign_up_page> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final passwordController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";
  String phone = "";
  String confirm_password = "";
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
                height: 70,
              ),
              big_font(
                text: "Create Account",
                size: 35,
                color: Colors.teal,
              ),
              SizedBox(
                height: 5,
              ),
              SmallFont(text: "Create a new account"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 35,
                      ),
                      SizedBox(
                        width: dimensions.size10 / 2,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: 'NAME',
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
                              return "name can't be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
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
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 35,
                      ),
                      SizedBox(
                        width: dimensions.size10 / 2,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: phoneController,
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'PHONE',
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
                              return "phone can't be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            phone = value;
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
                    children: [
                      Icon(
                        Icons.lock_open_rounded,
                        size: 35,
                      ),
                      SizedBox(
                        width: dimensions.size10 / 2,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: confirmpasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'CONFIRM PASSWORD',
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
                              return "Section can't be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            confirm_password = value;
                            setState(() {});
                          },
                        ),
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
                            text: "CREATE ACCOUNT",
                            color: Colors.white,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallFont(text: "Already have an account?"),
                      GestureDetector(
                        //onTap: () => Get.toNamed(RouteHelper.getlogin()),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(sign_in_page());
                          },
                          child: SmallFont(
                            text: " Login ",
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimensions.size20,
                  ),
                  Center(child: big_font(text: "Sign Up with")),
                  SizedBox(
                    height: dimensions.size15,
                  ),
                  Container(
                      height: 40,
                      width: double.maxFinite,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/google_logo.png"),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset("assets/images/facebook_logo.png"),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset("assets/images/linkedin_logo.png"),
                        ],
                      ))
                ]),
              )
            ]),
          ),
        ));
  }
}
