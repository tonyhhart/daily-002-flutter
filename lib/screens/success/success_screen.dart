import 'package:daily_002_flutter/models/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatefulWidget {
  SuccessScreen({super.key, this.address});

  Address? address;

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar("Add shipping address"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SUCCESS!",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF303030),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.5)),
              ),
              SvgPicture.asset("assets/success.svg",
                  semanticsLabel: 'Acme Logo'),
              SizedBox(
                height: 32,
              ),
              Text(
                "Your order will be delivered soon. Thank you for choosing our app!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
