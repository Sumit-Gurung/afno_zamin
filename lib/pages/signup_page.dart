import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/utils/routes.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isVisible = false;
  String name = "";
  final formkey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  var confirmPass;
  // void validate() {
  //   if (formkey.currentState.validate()) {
  //     print("ok");
  //   } else {
  //     print("error");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                child: Image.asset(
                  "assets/images/Afnoz.png",
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              Text(
                "Join Us",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: primarycolor),
              ),
              SizedBox(height: 10),
              Form(
                key: formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter UserName';
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
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          } else if (value != confirmPass) {
                            return "Password must be same as above";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter PhoneNumber",
                          labelText: "PhoneNumber",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter PhoneNumber';
                          } else if (value.length != 10) {
                            return "Phone Number Must be 10 digits";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "EmailAddress",
                        ),
                        // validator: (email) =>
                        //     email != null && !EmailValidator.validate(email)
                        //         ? 'Enter a valid Email'
                        //         : null,
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                          style:
                              TextButton.styleFrom(minimumSize: Size(110, 40)),
                          child: Text(
                            "SignUp",
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            final isValidForm =
                                formkey.currentState!.validate();
                            if (isValidForm) {
                              Navigator.pushNamed(context, MyRoutes.loginRoute);
                            }
                          }),
                      SizedBox(height: 35),
                      Center(
                          child: Row(
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: primarycolor))),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.loginRoute);
                              },
                              child: Text("Log IN",
                                  style: TextStyle(
                                      color: primarycolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),

                          // alignment: Alignment.center,
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
