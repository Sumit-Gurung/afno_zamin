import 'package:afnozamin/pages/notificationview.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);
  final int count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      //space between widgets
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: primarycolor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        Column(
          children: [
            Text(
              'Afno Zamin',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Container(
          child: Builder(
            builder: (context) => IconButton(
              icon: Badge(
                  badgeContent: Text('$count'),
                  badgeColor: primarycolor,
                  padding: EdgeInsets.all(3.0),
                  position: BadgePosition.topStart(),
                  animationType: BadgeAnimationType.slide,
                  child: Icon(
                    Icons.notifications,
                  )),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notificaionview()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
