import 'package:covid19/Source/Icons.dart';
import 'package:covid19/Source/color.dart';
import 'package:covid19/View/Module/MainPages/DonatePage/DonatePage.dart';
import 'package:covid19/View/Module/MainPages/HomePage/HomePage.dart';
import 'package:covid19/View/Module/MainPages/NewsPage/NewsPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    NewsPage(),
    DonatePage(),
  ];

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: cBottomNavBar,
        onTap: onTapped,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(navIcon1),
            title: Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(navIcon2),
            title: Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(navIcon3),
            title: Text(
              'Donate',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
