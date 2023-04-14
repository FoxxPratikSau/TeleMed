import 'package:flutter/material.dart';
import 'package:tele_med/widgets/dimensions.dart';

class NoItemsPage extends StatelessWidget {
  final String text;
  final String imagepath;
  const NoItemsPage(
      {super.key,
      required this.text,
      this.imagepath = "assets/images/empty_cart.png"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          imagepath,
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.25,
        ),
        SizedBox(
          height: dimensions.size20,
        ),
        Container(
          margin: EdgeInsets.all(dimensions.size20),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.red, fontSize: 16),
          )),
        )
      ],
    );
  }
}
