import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
  );
}

AppBar appBar(String title) {
  return AppBar(
    title: Text(title),
    elevation: 1,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    titleTextStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF090723))),
  );
}
