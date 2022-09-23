import 'package:afnozamin/pages/ename.dart';
import 'package:flutter/material.dart';

import '../BottomBar.dart';

class FavScreen extends StatefulWidget {
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite properties'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.favorite,
      ),
    );
  }
}
