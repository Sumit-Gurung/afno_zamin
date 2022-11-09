import 'package:afnozamin/model/user.dart';
import 'package:afnozamin/pages/Home_screen.dart';
import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginProcess() async {
    var data = {
      'username': usernameController.text,
      'password': passwordController.text
    };
    var bodyPart = json.encode(data);
    try {
      Response response = await http.post(
          Uri.parse("http://192.168.1.68:8000/login"),
          body: bodyPart,
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200 &&
          jsonDecode(response.body.toString()) != null) {
        print('Login successfully');
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print('failed to login');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  User user = User('', '', '', '');

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
              key: formKey,
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
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        PatternValidator((r'^[a-z A-Z]+$'),
                            errorText: 'Character only')
                      ]),
                      controller: usernameController,
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),

                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        MinLengthValidator(6,
                            errorText:
                                "Password must contain atleast 6 characters"),
                      ]),
                      controller: passwordController,

                      // setState(() {});
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Text('login')),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          //  save();
                          loginProcess();
                          print('ok');
                        } else {
                          print("not ok");
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
