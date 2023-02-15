import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledButton extends StatelessWidget {
  StyledButton(
      {super.key, required this.text, this.loading, required this.onPressed});

  final String text;
  final VoidCallback? onPressed;
  bool? loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading != false ? onPressed : () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading == true)
            Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2.0),
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF242424),
          minimumSize: const Size.fromHeight(50),
          elevation: 15,
          shadowColor: const Color(0xAA000000),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }
}
