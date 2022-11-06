import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/routes.dart';
import '../BottomBar.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final formkey = GlobalKey<FormState>();
  List<String> purposes = ['Rent', "Sell"];
  late String _selectedPurpose = purposes[0];

  List<String> propertyType = ['Land', 'Building', "Commercial"];
  late String _selectedProperty = propertyType[0];

  final ImagePicker _picker = ImagePicker();

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
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/Afnoz.png")),
            ),
          ),
          Center(
            child: Text(
              "Add Your Property",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          SizedBox(height: 17),
          Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Property Title",
                      labelText: "Title",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Price",
                      labelText: "Price",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Price';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Area",
                      labelText: "Area",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Area';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Location",
                      labelText: "Location",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Location';
                      }
                      return null;
                    },
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
                  SizedBox(height: 7),
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
                                color: primarycolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),

                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: primarycolor))),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      final isValidForm = formkey.currentState!.validate();
                      if (isValidForm) {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      }
                    },
                    style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                    child: Text(
                      "ADD PROPERTY",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
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
