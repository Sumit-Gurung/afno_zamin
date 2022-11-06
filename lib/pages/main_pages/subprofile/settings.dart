import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/notificationview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({Key? key}) : super(key: key);

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  bool _isVisible = false;
  var confirmPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 20),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: primarycolor,
                ),
                SizedBox(width: 8),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Change password'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              obscureText: !_isVisible,
                              // obscureText: true,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: _isVisible
                                      ? Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                ),
                                hintText: "Enter Password",
                                labelText: "Password",
                              ),
                              validator: (value) {
                                confirmPass = value;
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              obscureText: !_isVisible,
                              // obscureText: true,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: _isVisible
                                      ? Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                ),
                                hintText: "Re-Enter Password",
                                labelText: "Password",
                              ),
                              validator: (value) {
                                confirmPass = value;
                                if (value == null || value.isEmpty) {
                                  return 'Please re-enter Password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        actions: [
                          FloatingActionButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          )
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: primarycolor,
                    )
                  ],
                ),
              ),
            ),
            gesdetector(context, "content settings"),
            gesdetector(context, "Social"),
            gesdetector(context, "Language"),
            gesdetector(context, "Privacy and Security"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: primarycolor,
                ),
                SizedBox(width: 8),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Show notification',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: true,
                    onChanged: (bool val) {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  GestureDetector gesdetector(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("option 2"),
                    Text('option 3'),
                  ],
                ),
                actions: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  )
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: primarycolor,
            )
          ],
        ),
      ),
    );
  }
}
