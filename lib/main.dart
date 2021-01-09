import 'package:covid19/Source/color.dart';
import 'package:covid19/View/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: white,
        scaffoldBackgroundColor: cBackgroundColor,
      ),
      home: Home(),
    );
  }
}
