import 'package:flutter/material.dart';

class TopPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        //margin: EdgeInsets.all(15),
        padding: EdgeInsets.fromLTRB(15, 40, 5, 0),
        height: 250,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment
                .bottomLeft, // 10% of the width, so there are ten blinds.
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
          // image: DecorationImage(
          //   alignment: Alignment.centerLeft,
          //   image: AssetImage('assets/virus.png'),
          // ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'COVID-19 Tracker',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Limit the scare of \nCOVID-19",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Take precautions,don't panic and\nreach out to the doctor",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.asset(
                    "assets/2.png",
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
