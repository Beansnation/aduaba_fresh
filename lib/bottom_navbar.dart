import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'discover/discover.dart';
import 'home_screen.dart';


class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(
            color: stepperColor,
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, -1))
      ]),
      child: Row(children: [
        buildNavBar(
          Icons.home_outlined,
          0,
          padding: EdgeInsets.only(left: 80.0),
          ontap: () {
            setState(() {
              selectedIndex = 0;
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            });
          },
        ),
        buildNavBar(
          Icons.search,
          1,
          ontap: () {
            setState(() {
              selectedIndex = 1;
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Discover()));
            });
          },
        ),
        buildNavBar(Icons.more_horiz, 2, padding: EdgeInsets.only(right: 80.0),
            ontap: () {
          setState(() {
          });
        }),
      ]),
    );
  }

  Widget buildNavBar(IconData icon, int index,
      {EdgeInsetsGeometry? padding, ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: padding,
        height: 80,
        width: MediaQuery.of(context).size.width / 3,
        child: Icon(icon,
            size: 32,
            color: index == selectedIndex ? primaryGreen : hintTextColor),
      ),
    );
  }
}
