import 'package:flutter/material.dart';

class Category_Block extends StatelessWidget {
  const Category_Block({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
            width: 100,
            height: 50,
            fit: BoxFit.cover,
            "https://images.pexels.com/photos/3422964/pexels-photo-3422964.jpeg?auto=compress&cs=tinysrgb&w=600"),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black26),
      ),
      Positioned(
        left: 30,
        top: 15,
        child: Text(
          "Cars",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      )
    ]));
  }
}
