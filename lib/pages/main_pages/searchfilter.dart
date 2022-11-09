import 'package:afnozamin/model/user.dart';
import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:afnozamin/pages/individualPage.dart';
import 'package:flutter/material.dart';
import '../BottomBar.dart';

class Searchfilter extends StatefulWidget {
  @override
  State<Searchfilter> createState() => _SearchfilterState();
}

class _SearchfilterState extends State<Searchfilter> {
  // List of items in our dropdown menu

  List<Map<String, String>> _foundusers = [];
  @override
  void initState() {
    _foundusers = productList;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, String>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = productList;
    } else {
      results = productList
          .where((user) => user["name"]!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundusers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                //remove bar
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _foundusers.map((e) => PropertyTile(e)).toList(),
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.search,
      ),
    );
  }
}

class PropertyTile extends StatelessWidget {
  Map<String, dynamic> properties;

  PropertyTile(
    this.properties, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => individualpage()));
      }),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(
            color: primarycolor,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(properties['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${properties['name']}",
                style: TextStyle(
                  fontSize: 15,
                  color: primarycolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Price: ${properties['price']}"),
              Text("Description: ${properties['disc']}"),
            ],
          ),
        ]),
      ),
    );
  }
}
