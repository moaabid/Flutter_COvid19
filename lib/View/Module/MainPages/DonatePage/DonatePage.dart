import 'package:covid19/Source/Icons.dart';
import 'package:covid19/Source/color.dart';
import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.8),
          children: <Widget>[
            DonatePanel(
              title: "FAQ",
              iconColor: Colors.deepOrange,
              textColor: Colors.deepOrange,
              panelIcon: panelIcon1,
            ),
            DonatePanel(
              title: "Myths",
              iconColor: Colors.deepPurple,
              textColor: Colors.deepPurple,
              panelIcon: panelIcon2,
            ),
            DonatePanel(
              title: "Hygiene",
              iconColor: Colors.teal,
              textColor: Colors.teal,
              panelIcon: panelIcon3,
            ),
            DonatePanel(
              title: "Symptoms",
              iconColor: Colors.amber,
              textColor: Colors.amber,
              panelIcon: panelIcon4,
            ),
          ],
        ),
      ),
    );
  }
}

class DonatePanel extends StatelessWidget {
  final String title;
  final IconData panelIcon;
  final Color iconColor;
  final Color textColor;

  const DonatePanel({
    Key key,
    this.title,
    this.panelIcon,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 3),
          width: width / 3,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: cBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                     offset: Offset(0, 4),
                  blurRadius: 15,
                  color: cShadowColor,)
              ]),
          child: Column(
            children: <Widget>[
              Icon(
                panelIcon,
                color: textColor,
              ),
              Text(title,
                  style:
                      TextStyle(color: iconColor, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
