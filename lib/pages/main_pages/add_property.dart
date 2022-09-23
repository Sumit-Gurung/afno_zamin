import 'package:afnozamin/pages/ename.dart';
import 'package:flutter/material.dart';

import '../BottomBar.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add  property'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.addpropery,
      ),
    );
  }
}
