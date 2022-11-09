import 'package:afnozamin/controllers/favorites_controller.dart';
import 'package:afnozamin/controllers/products_controller.dart';
import 'package:afnozamin/pages/Home_screen.dart';
import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/signup_page.dart';
import 'package:afnozamin/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';
import 'pages/Home_screen.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(ScoreApp());
}

class ScoreApp extends StatelessWidget {
  const ScoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductController()),
        ChangeNotifierProvider(create: (context) => FavoriteController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Afno_Zamin",
        themeMode: ThemeMode.light,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: primarycolor),
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
      ),
    );
  }
}
