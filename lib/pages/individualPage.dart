import 'package:afnozamin/pages/ename.dart';
import 'package:flutter/material.dart';

import 'BottomBar.dart';

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
    );
  }
}
