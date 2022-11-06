import 'package:afnozamin/model/user.dart';
import 'package:afnozamin/pages/Home_screen.dart';
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
  final _formKey = GlobalKey<FormState>();
   TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
    void loginProcess() async {
      var data = {
          'username' : usernameController.text,
          'password' : passwordController.text
        };
       var bodyPart = json.encode(data);
    try{
      
      Response response = await http.post(
        Uri.parse("http://192.168.1.68:8000/login"),
        body: bodyPart,
        headers: {
          "Content-Type":"application/json"
        }
      );

      if(response.statusCode == 200&& jsonDecode(response.body.toString())!=null){
        
       
        
        print('Login successfully');
     Navigator.push(context, new MaterialPageRoute(builder: (context) => HomeScreen()));

        
      }else {
        print('failed to login');
      }
    }catch(e){
      print(e.toString());
    }

  }

  User user = User('', '','','');
  
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                    validator:MultiValidator([ RequiredValidator(errorText: "Required"),
                       PatternValidator((r'^[a-z A-Z]+$'), errorText: 'Character only')]),
                          
                    controller:usernameController ,
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
                            if (_formKey.currentState!.validate()) {
                              //  save();
                              loginProcess();
                            print('ok');
                          } else {
                            print("not ok");
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
                          
                          child: Text("SIGN UP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
              
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
