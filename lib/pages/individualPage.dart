import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
// import 'package:afnozamin/pages/search_bar.dart';
import 'package:afnozamin/pages/slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'BottomBar.dart';
// import 'Custom_appbar.dart';

class individualpage extends StatefulWidget {
  @override
  State<individualpage> createState() => _individualpageState();
}

class _individualpageState extends State<individualpage> {
  bool islike = false;
  final Color inactiveColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Detail'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.userprofile,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          canLaunchUrlString('tel:+9806773686');
        },
        child: Icon(Icons.phone),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            ProductSlider(),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "House Lamachaur",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rs.15000000",
                            style: TextStyle(
                              color: primarycolor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          icon: Icon(
                            islike
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: islike ? Colors.red : inactiveColor,
                            size: 16,
                          ),
                          onPressed: () {
                            setState(() {
                              islike = !islike;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailCard(icon: Icons.location_city, text: 'Lamachaur'),
                      DetailCard(icon: Icons.category, text: 'Sell'),
                      DetailCard(icon: Icons.area_chart, text: '100sq.m'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            color: primarycolor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'lorem ubac ihkascikh goaschasi hasi hasi ihiah +6+5asc ascasc a ascascasc',
                          style: TextStyle(
                            color: Color.fromARGB(255, 95, 95, 95),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ], //children
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const DetailCard({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 110,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: primarycolor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 95, 95, 95),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
