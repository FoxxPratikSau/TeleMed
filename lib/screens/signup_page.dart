import 'package:flutter/material.dart';
import 'package:tele_med/components/rounded_button.dart';
import 'package:tele_med/constants.dart';
import 'package:tele_med/screens/initiate_app.dart';
import '../widgets/big_font.dart';
import '../widgets/small_font.dart';
import 'package:tele_med/screens/login_page.dart';
import 'package:tele_med/components/textfield.dart';
import 'package:tele_med/screens/initiate_app.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final passwordController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";
  String phone = "";
  String confirmPassword = "";
  bool change = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          BigFont(
            text: "Create Account",
            size: 35,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                  onPress: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InitiatePage(),
                      ),
                    );
                  }),
                  bgColor: kPrimaryColor,
                  title: 'CREATE ACCOUNT',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallFont(text: "Already have an account? "),
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      }),
                      child: SmallFont(
                        text: "Login",
                        color: Colors.red,
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
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: null,
                        child: Image.asset("images/google_logo.png"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: null,
                        child: Image.asset("images/facebook_logo.png"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: null,
                        child: Image.asset("images/twitter_logo.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
