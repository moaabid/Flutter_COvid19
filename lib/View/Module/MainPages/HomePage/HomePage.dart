import 'dart:convert';
import 'package:covid19/Source/color.dart';
import 'package:covid19/View/Module/MainPages/HomePage/Components/CaseUpdate.dart';
import 'package:covid19/View/Module/MainPages/HomePage/Components/Catagory.dart';
import 'package:covid19/View/Module/MainPages/HomePage/Components/TopPanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/all");
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TopPanel(),
            worldData==null?Center(child: CircularProgressIndicator(backgroundColor: cBottomNavBar,)):CaseUpdate(worldData:worldData),
            CategoryPanel(),
          ],
        ),
      ),
    );
  }
}
