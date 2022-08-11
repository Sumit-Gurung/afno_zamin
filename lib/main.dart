// import 'dart:async';
// import 'dart:math';

// ignore_for_file: prefer_const_constructors;

import 'package:afnozamin/pages/main_page.dart';
import 'package:afnozamin/pages/signup_page.dart';
import 'package:afnozamin/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(ScoreApp());
}

class ScoreApp extends StatelessWidget {
  const ScoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Afno_Zamin",
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomeScreen(),
        MyRoutes.signupRoute: (context) => SignupPage(),
      },
      initialRoute: MyRoutes.loginRoute,
      // home: HomeScreen(),
    );
  }
}
