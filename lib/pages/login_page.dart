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
            Image.asset(
              "assets/images/Afno.png",
              fit: BoxFit.cover,
              height: 215,
            ),
            Text(
              "welcome $name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            SizedBox(height: 25),
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
                      child: Text("Login"),
                    ),
                    SizedBox(height: 35),
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
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
