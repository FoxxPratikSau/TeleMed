import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../widgets/big_font.dart';
import '../widgets/small_font.dart';
import '../widgets/dimensions.dart';

class signup_doctor extends StatefulWidget {
  const signup_doctor({super.key});

  @override
  State<signup_doctor> createState() => _signup_doctorState();
}

class _signup_doctorState extends State<signup_doctor> {
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
        color: Colors.white,
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
              ),
              SizedBox(
                height: 5,
              ),
              small_font(text: "Create a new account"),
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
                                    width: 3, color: Colors.blue),
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
                    height: 30,
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
                                    width: 3, color: Colors.blue),
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
                                    width: 3, color: Colors.blue),
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
                                    width: 3, color: Colors.blue),
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
                    height: 30,
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
                                    width: 3, color: Colors.blue),
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
                          color: Color.fromARGB(255, 2, 49, 220)),
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
                      small_font(text: "Already have an account?"),
                      GestureDetector(
                        //onTap: () => Get.toNamed(RouteHelper.getlogin()),
                        child: small_font(
                          text: " Login ",
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                            width: 15,
                          ),
                          Image.asset("assets/images/facebook_logo.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset("assets/images/linkedin_logo.png"),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ))
                ]),
              )
            ]),
          ),
        ));
  }
}
