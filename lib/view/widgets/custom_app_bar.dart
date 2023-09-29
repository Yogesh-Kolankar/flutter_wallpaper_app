import 'package:flutter/material.dart';

class Custom_App_Bar extends StatelessWidget {
  const Custom_App_Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Wallpaper",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
        TextSpan(
            text: '  App',
            style: TextStyle(
                fontSize: 15,
                color: Colors.orange,
                fontWeight: FontWeight.bold))
      ])),
    );
  }
}
