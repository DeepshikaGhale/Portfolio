import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_application/profilepage.dart';

void main(List<String> args) {
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColorLight: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      home: ProfilePage(),
    );
  }
}