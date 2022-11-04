// ignore_for_file: prefer_const_constructors

import 'package:afnozamin/pages/Home_screen.dart';
import 'package:afnozamin/pages/category/category.dart';
import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/login_page.dart';
import 'package:afnozamin/pages/main_pages/property_list.dart';
import 'package:afnozamin/pages/main_pages/user_profile.dart';
import 'package:afnozamin/pages/products/recent_products.dart';
import 'package:afnozamin/pages/signup_page.dart';
import 'package:afnozamin/pages/slider/slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
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
                height: 4,
              ),
              SearchBar(),
              SizedBox(
                height: 5,
              ),
              //to create slider
              //we create asset foler and import the required images
              // giving image folder path in pubspec
              ProductSlider(),
              //defininig size for categories
              // SizedBox(
              //   height: 20,
              // ),
              Category(),
              // SizedBox(
              //   height: 20,
              // ),
              Container(height: 272, child: RecentProducts()),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Center(
              child: UserAccountsDrawerHeader(
                accountName: Text("Afno Zamin"),
                accountEmail: Text("afnozamin@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/Afnoz.png',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: const Text('Explore Properties'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PropScreen()));
              },
            ),
            const Divider(
              color: primarycolor,
            ),
            ListTile(
                leading: Icon(Icons.login_rounded),
                title: const Text('Login-IN'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
            ListTile(
              leading: Icon(Icons.laptop_chromebook_rounded),
              title: const Text('Sign-Up'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Log-Out'),
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
