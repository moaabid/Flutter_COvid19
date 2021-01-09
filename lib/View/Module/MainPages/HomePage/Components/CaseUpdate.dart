import 'package:covid19/Source/color.dart';
import 'package:flutter/material.dart';

class CaseUpdate extends StatelessWidget {
  final Map worldData;

  const CaseUpdate({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(children: <Widget>[
            Text(
              "Global Cases",
              style: cTitleTextstyle,
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlueAccent.withOpacity(.16),
              ),
              child: Text('Regional',
                  style: TextStyle(
                    color: cPrimaryColor,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ]),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 15,
                  color: cShadowColor,
                )
              ]),
          child: CaseData(worldData: worldData),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class CasePanel extends StatelessWidget {
  final int number;
  final Color circleColor;
  final Color numberColor;
  final Color iconColor;
  final String title;
  final IconData icon;

  const CasePanel({
    Key key,
    this.number,
    this.circleColor,
    this.numberColor,
    this.title,
    this.iconColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 20),
      Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: circleColor,
        ),
        child: Container(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
      SizedBox(height: 10),
      Text('$number', style: TextStyle(fontSize: 20, color: numberColor)),
      Text(title, style: cSubTextStyle),
      
    ]);
  }
}

class CaseData extends StatelessWidget {
  final Map worldData;
  const CaseData({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Confirmed Cases",
              style: TextStyle(color: cTextLightColor, fontSize: 24)),
          Text(worldData['cases'].toString(),
              style: TextStyle(fontSize: 30, color: Colors.blue)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CasePanel(
                  number: worldData['active'],
                  circleColor: cInfectedColor.withOpacity(.45),
                  iconColor: cInfectedColor,
                  numberColor: cInfectedColor,
                  title: "ACTIVE",
                  icon: Icons.add,
                ),
                CasePanel(
                  number: worldData['recovered'],
                  circleColor: cRecovercolor.withOpacity(.45),
                  iconColor: cRecovercolor,
                  numberColor: cRecovercolor,
                  title: "Recovered",
                  icon: Icons.favorite_border,
                ),
                CasePanel(
                  number: worldData['deaths'],
                  circleColor: cDeathColor.withOpacity(.45),
                  iconColor: cDeathColor,
                  numberColor: cDeathColor,
                  title: "Death",
                  icon: Icons.clear,
                ),
              ]),
        ],
      ),
    );
  }
}
