import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PreviewCard extends StatefulWidget {
  PreviewCard(
      {super.key,
      required this.holder,
      required this.number,
      required this.expiration});

  TextEditingController holder;
  TextEditingController number;
  TextEditingController expiration;

  @override
  State<PreviewCard> createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard> {
  String holder = 'HOLDER NAME';
  String number = '';
  String expiration = 'MM/AA';

  @override
  void initState() {
    widget.holder.addListener(() {
      setState(() {
        holder = widget.holder.value.text;
      });
    });
    widget.number.addListener(() {
      setState(() {
        number = widget.number.value.text ?? "";
      });
    });
    widget.expiration.addListener(() {
      setState(() {
        expiration = widget.expiration.value.text ?? "";
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0XFF242424),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/mastercard_color.svg",
                        semanticsLabel: 'Acme Logo'),
                    Row(
                      children: [
                        for (var i = 0; i < 19; i++)
                          Text(
                            number.length > i
                                ? number.substring(i, i + 1)
                                : [4, 9, 14].contains(i)
                                    ? " "
                                    : "*",
                            style: GoogleFonts.robotoMono(
                                textStyle: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300)),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card Holder Name",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0x99FFFFFF),
                                        fontSize: 12)),
                              ),
                              Text(
                                holder,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 14,
                                        height: 1.5)),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expiry Date",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0x99FFFFFF),
                                        fontSize: 12)),
                              ),
                              Text(
                                expiration,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 14,
                                        height: 1.5)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset("assets/mastercard_background.svg",
                semanticsLabel: 'Acme Logo')),
      ],
    );
  }
}
