import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:afnozamin/pages/main_pages/add_property.dart';
import 'package:afnozamin/pages/main_pages/fav_page.dart';
//import 'package:afnozamin/pages/main_pages/search_page.dart';
import 'package:afnozamin/pages/main_pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Home_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inactiveColor = Colors.grey;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFDADADA),
              offset: Offset(0, -15),
              blurRadius: 20,
            ),
          ]),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/icons/home.svg',
                color: MenuState.home == selectedMenu
                    ? primarycolor
                    : inactiveColor,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            IconButton(
              // onPressed: () {
              //     Navigator.push(context,
              //        MaterialPageRoute(builder: (context) => SearchScreen()));
              // },

              // icon: SvgPicture.asset(
              //   'assets/images/icons/search.svg',

              //   color: MenuState.search == selectedMenu
              //       ? primarycolor
              //       : inactiveColor,
              // ),
              icon: Icon(
                Icons.image_search_outlined,
                color: MenuState.search == selectedMenu
                    ? primarycolor
                    : inactiveColor,
                size: 35,
              ),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddScreen()));
              },
              icon: SvgPicture.asset(
                'assets/images/icons/add.svg',
                color: MenuState.addpropery == selectedMenu
                    ? primarycolor
                    : inactiveColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavScreen()));
              },
              icon: SvgPicture.asset(
                'assets/images/icons/favorite.svg',
                color: MenuState.favorite == selectedMenu
                    ? primarycolor
                    : inactiveColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
              icon: SvgPicture.asset(
                'assets/images/icons/user.svg',
                color: MenuState.userprofile == selectedMenu
                    ? primarycolor
                    : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final Prop = [
    'fubari',
    'lamachaur',
    'bagar',
    'mahendrapool',
    'ranibari',
    'lazim'
  ];
  final RecentProp = ['fubari', 'lamachaur', 'bagar'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icons
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show result best on selections

    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show suggestions
    final suggestionList = query.isEmpty
        ? RecentProp
        : Prop.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.location_city),
            title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.greenAccent, fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ])) //Text(suggestionList[index]),
            ),
        itemCount: suggestionList.length);
  }
}
