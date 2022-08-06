import 'package:afnozamin/utils/routes.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name = "";
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
              "Join Us",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter PhoneNumber",
                      labelText: "PhoneNumber",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      labelText: "EmailAddress",
                    ),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                    child: Text("SignUp"),
                  ),
                  SizedBox(height: 35),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                    child: Center(
                      child: Container(
                        // // height: 40,
                        // width: 60,
                        child: Text("Log IN",
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
          ],
        ));
  }
}
