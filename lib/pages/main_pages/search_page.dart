import 'package:afnozamin/pages/ename.dart';
import 'package:flutter/material.dart';

import '../BottomBar.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search properties'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.search,
      ),
    );
  }
}
