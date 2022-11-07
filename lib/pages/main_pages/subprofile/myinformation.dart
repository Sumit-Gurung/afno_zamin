import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/notificationview.dart';
import 'package:flutter/material.dart';

class Myinfo extends StatelessWidget {
  const Myinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text('My information'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                  color: primarycolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            Listprofile(Icons.person, 'UserName', 'Sumit Gurung'),
            Listprofile(Icons.email, 'Email', 'sumitgurung@gces.edu.np'),
            Listprofile(Icons.phone, 'Phone', '9866000000'),
          ],
        ),
      ),
    );
  }

  Widget Listprofile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
              Text(
                text2,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
