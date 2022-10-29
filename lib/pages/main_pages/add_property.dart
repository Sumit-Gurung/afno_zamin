import 'package:afnozamin/pages/ename.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/routes.dart';
import '../BottomBar.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<String> purposes = ['Rent', 'Buy', "Sell"];
  late String _selectedPurpose = purposes[0];

  List<String> propertyType = ['Land', 'Building', "Commercial"];
  late String _selectedProperty = propertyType[0];

  ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add  property'),
        // backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/Afno.png")),
            ),
          ),
          Center(
            child: Text(
              "Add Your Property",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Property Title",
                    labelText: "Title",
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Price",
                    labelText: "Price",
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Area",
                    labelText: "Area",
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Location",
                    labelText: "Location",
                  ),
                ),
                SizedBox(height: 7),
                // DropdownButton(items: purposeValues.map((p){ return  DropDownMenuItem(child: Text(p), value: p)}).toList()),

                DropdownButton(
                    isExpanded: true,
                    value: _selectedPurpose,
                    items: purposes
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (v) {
                      if (v != null) {
                        _selectedPurpose = (v as String);
                        setState(() {});
                      }
                    }),
                DropdownButton(
                    isExpanded: true,
                    value: _selectedProperty,
                    items: propertyType
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (v) {
                      if (v != null) {
                        _selectedProperty = (v as String);
                        setState(() {});
                      }
                    }),
                GestureDetector(
                  onTap: () {
                    _picker.pickImage(source: ImageSource.gallery);
                  },
                  child: Center(
                    child: Container(
                      // // height: 40,
                      // width: 60,
                      child: Text("Upload photo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),

                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.black))),
                    ),
                  ),
                ),

                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                  child: Text("ADD Property"),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.addpropery,
      ),
    );

    // );
  }
}