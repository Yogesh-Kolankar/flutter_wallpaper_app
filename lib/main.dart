import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/controller/apiOperation.dart';
import 'package:flutter_wallpaper_app/view/screens/category.dart';
import 'package:flutter_wallpaper_app/view/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wallpaper App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomeScreen(),
    );
  }
}
