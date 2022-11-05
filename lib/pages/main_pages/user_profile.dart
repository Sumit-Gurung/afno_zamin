import 'package:afnozamin/pages/drawer.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:afnozamin/pages/product/product_page.dart';
import 'package:flutter/material.dart';
import '../BottomBar.dart';
import '../Custom_appbar.dart';
import 'subprofile/profile_menu.dart';
import 'subprofile/profile_pic.dart';
import 'package:afnozamin/utils/routes.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.userprofile,
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Container(
            child: Column(
              children: [
                CustomAppBar(),
                ProfilePic(),
                SizedBox(height: 20),
                ProfileMenu(
                  text: "My Property",
                  icon: "assets/images/property.png",
                  press: () => ProductPage(),
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/images/settings.png",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/images/logout.png",
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: drawer(),
    );
  }
}
