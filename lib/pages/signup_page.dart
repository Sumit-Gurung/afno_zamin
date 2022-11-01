import 'package:afnozamin/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name = "";
   final _formKey = GlobalKey<FormState>();
   TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


 
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Form(
          key: _formKey,
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
                      validator:MultiValidator([ RequiredValidator(errorText: "Required"),
                       PatternValidator((r'^[a-z A-Z]+$'), errorText: 'Character only')]),
                          
                          controller: _nameController,
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
                          controller: _passwordController,

                    ),
                    TextFormField(
                      obscureText: true,
                      
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                      ),
                  //    
                controller: _confirmController,
                validator: (val){
                              if(val==null) {
                                return 'Empty';
                              }
                              if(val != _passwordController.text){
                                   return 'Not Match';
                              }
                              return null;
                              }
                       
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter PhoneNumber",
                        labelText: "PhoneNumber",
                      ),
                      validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                           PatternValidator( r'^[0-9]{10}$', errorText: "only 10 digits allowed !")
                          ]),
                          controller: _phoneNumberController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        labelText: "EmailAddress",
                      ),
                      validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(
                                errorText:
                                    "Please enter a valid email address"),
                          ]),
                          controller: _emailController,
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                             
                       Navigator.pushNamed(context, MyRoutes.loginRoute);
                                
                              
                            }
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
          ),
        ));
  }
}
