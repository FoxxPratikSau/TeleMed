import 'package:flutter/material.dart';
import 'package:tele_med/components/rounded_button.dart';
import 'package:tele_med/components/textfield.dart';
import 'package:tele_med/constants.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:tele_med/screens/signup_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email = "";
  String password = "";
  bool change = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/profile2.png',
            scale: 2.7,
            color: Colors.black26,
          ),
          const SizedBox(
            height: 10,
          ),
          BigFont(
            text: "Welcome Back",
            size: 35,
            color: Colors.black87,
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                IntroButton(
                  onPress: null,
                  bgColor: kPrimaryColor,
                  title: 'LOGIN',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallFont(text: "Don't have account? "),
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        );
                      }),
                      child: SmallFont(
                        text: "Create a new account",
                        color: Colors.red,
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
    );
  }
}
