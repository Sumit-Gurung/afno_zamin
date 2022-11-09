import 'package:afnozamin/model/user.dart';
import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:afnozamin/pages/individualPage.dart';
import 'package:flutter/material.dart';

import '../BottomBar.dart';

class PropScreen extends StatefulWidget {
  @override
  State<PropScreen> createState() => _PropScreenState();
}

class _PropScreenState extends State<PropScreen> {
  String dropdownvalue = 'Sort By';
  bool isDescending = false;

  // List of items in our dropdown menu
  var items = [
    'Sort By',
    'Default',
    'Price (Ascending)',
    'Price (Descending)',
  ];
  List<Map<String, String>> _foundusers = [];
  List<Map<String, String>> sorteddata = [];
  @override
  void initState() {
    _foundusers = productList;
    super.initState();
  }

  List<Map<String, String>> results = [];
  void _runFilter() {
    results = productList
      ..sort((item1, item2) => item1['price']!.compareTo(item2['price']!));
    setState(() {
      _foundusers = results;
    });
  }

  void _runreverse() {
    results = productList
      ..sort((item1, item2) => item1['price']!.compareTo(item2['price']!));
    setState(() {
      _foundusers = results.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Properties list'),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: primarycolor,
              ),
            ),
            height: 50.0,
            width: 250.0,
            child: DropdownButton(
              // Initial Value
              isExpanded: true,
              value: dropdownvalue,
              style: TextStyle(
                color: primarycolor,
                fontSize: 16,
              ),

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  if (dropdownvalue == "Price (Ascending)") {
                    _runreverse();
                  }
                  if (dropdownvalue == "Price (Descending)") {
                    _runFilter();
                  }

                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: _foundusers.map((e) => PropertyTile(e)).toList(),
            ),
          )
        ]));
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
