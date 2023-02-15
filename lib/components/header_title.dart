import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderTitle extends StatelessWidget {
  HeaderTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              height: 1.5,
              color: Color(0xFF242424))),
    );
  }
}
