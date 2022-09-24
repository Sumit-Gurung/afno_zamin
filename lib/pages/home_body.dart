// ignore_for_file: prefer_const_constructors

import 'package:afnozamin/pages/category/category.dart';
import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/login_page.dart';
import 'package:afnozamin/pages/products/recent_products.dart';
import 'package:afnozamin/pages/signup_page.dart';
import 'package:afnozamin/pages/slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'Custom_appbar.dart';
import 'search_bar.dart';

class homebody extends StatefulWidget {
  const homebody({Key? key}) : super(key: key);

  @override
  State<homebody> createState() => _homebodyState();
}

class _homebodyState extends State<homebody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //using safearea to show appbar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              CustomAppBar(),
              //create column and row inside it
              //space between bar and  search
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              SearchBar(),
              SizedBox(
                height: 20,
              ),
              //to create slider
              //we create asset foler and import the required images
              // giving image folder path in pubspec
              ProductSlider(),
              //defininig size for categories
              SizedBox(
                height: 20,
              ),
              Category(),
              SizedBox(
                height: 20,
              ),
              Container(height: 300, child: RecentProducts()),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: primarycolor,
              ),
              child: Text('Afno-Zamin'),
            ),
            ListTile(
                title: const Text('Login-IN'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
            ListTile(
              title: const Text('Sign-Up'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
