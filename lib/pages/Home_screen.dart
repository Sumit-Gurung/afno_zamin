// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:afnozamin/pages/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'BottomBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: homebody(),
      //creating navigaion bar
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
