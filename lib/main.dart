import 'package:demo_app/pages/drawer.dart'; // Replace with your actual page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vinove',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.raleway().fontFamily, // Use Google Fonts Raleway
      ),
      home: HomeScreen(), // HomeScreen is left as is
    );
  }
}
