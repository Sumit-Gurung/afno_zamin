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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Detail'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.userprofile,
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
              Column(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
