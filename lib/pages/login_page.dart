import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool _isVisible = false;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 20),
              child: Image.asset(
                "assets/images/Afnoz.png",
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
            Text(
              "welcome $name",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: primarycolor),
            ),
            SizedBox(height: 16),
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
                      onChanged: (value) {
                        name = value;
                        setState(() {});
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
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {
                        final isValidForm = formkey.currentState!.validate();
                        if (isValidForm) {
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        }
                      },
                      style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Row(children: [
                        Text("Don't Have an Account? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, MyRoutes.signupRoute);
                          },
                          child: Center(
                            child: Container(
                              // // height: 40,
                              // width: 60,
                              child: Text("SIGN UP",
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
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
