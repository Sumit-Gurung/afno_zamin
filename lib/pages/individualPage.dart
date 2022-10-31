import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:afnozamin/pages/search_bar.dart';
import 'package:afnozamin/pages/slider/slider.dart';
import 'package:flutter/material.dart';

import 'BottomBar.dart';
import 'Custom_appbar.dart';

class individualpage extends StatefulWidget {
  @override
  State<individualpage> createState() => _individualpageState();
}

class _individualpageState extends State<individualpage> {
  bool islike = false;
  final Color inactiveColor = Colors.black38;
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
        child: Icon(Icons.phone),
        onPressed: () => {
          //do something
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              //to create slider
              //we create asset foler and import the required images
              // giving image folder path in pubspec
              ProductSlider(),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "House for SELL at Lamachaur",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: primarycolor,
                            borderRadius: BorderRadius.circular(30)),
                        child: IconButton(
                          icon: Icon(
                            islike
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: islike ? Colors.red : inactiveColor,
                            size: 15,
                          ),
                          onPressed: () {
                            setState(() {
                              islike = !islike;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text("Price: Rs.15000000",
                        style: TextStyle(
                            color: primarycolor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text("Description:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                        "A house is a single-unit residential building. It may range in complexity from a rudimentary hut to a complex structure of wood, masonry, concrete or other material, outfitted with plumbing, electrical, and heating, ventilation, and air conditioning systems",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
