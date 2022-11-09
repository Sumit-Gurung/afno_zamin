import 'dart:convert';
import 'dart:io';

import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

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
  String? imagepath;
  //changes
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Future pickImage() async {
    try {
      final pickedfile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedfile != null) {
        setState(() {
          imagepath = pickedfile.path;
        });
      }
    } catch (e) {
      print('fail to select');
    }
  }

  void addProduct() async {
    // var data = {

    //     'image' : imagepath

    //     };
    //  var bodyPart = json.encode(data);
    try {
      var request = http.MultipartRequest(
          "POST", Uri.parse("http://192.168.1.92:8000/addProduct"));
      request.fields['title'] = titleController.text;
      request.fields['price'] = priceController.text;
      request.fields['area'] = areaController.text;
      request.fields['location'] = locationController.text;
      request.fields['purpose'] = _selectedPurpose;
      request.fields['category'] = _selectedProperty;
      request.files.add(await http.MultipartFile.fromPath('image', imagepath!));

      request.send().then((response) {
        if (response.statusCode == 200) {
          print(' successful upload ');
          // ignore: use_build_context_sync
          //hronously, unnecessary_new
          // Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginPage()));

        } else {
          print('failed to upload');
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

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
                image: DecorationImage(
                    image: AssetImage("assets/images/Afno.png")),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 35),
                    child: Column(children: [
                      TextFormField(
                        controller: titleController,
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
                        controller: priceController,
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
                        controller: areaController,
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
                        controller: locationController,
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
                          // _picker.pickImage(source:ImageSource.gallery);
                          pickImage();
                        },
                        child: Center(
                          child: Container(
                            child: Text(
                              "upload image",
                              style: TextStyle(
                                  color: primarycolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: primarycolor))),
                          ),
                        ),
                      ),

                      SizedBox(height: 25),

                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            addProduct();
                            print('ok');
                            // Navigator.pushNamed(context, MyRoutes.homeRoute);
                          } else {
                            print('not ok');
                          }
                        },
                        style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                        child: Text(
                          "ADD PROPERTY",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20),
                    ])))
          ],
        ),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.addpropery));

    // );
  }
}
