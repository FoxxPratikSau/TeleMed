import 'package:flutter/material.dart';

class NoItemsPage extends StatelessWidget {
  final String text;
  final String imagepath;
  const NoItemsPage(
      {super.key,
      required this.text,
      this.imagepath = "assets/images/empty_cart.png"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imagepath,
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Center(
                child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 16),
            )),
          )
        ],
      ),
    );
  }
}
