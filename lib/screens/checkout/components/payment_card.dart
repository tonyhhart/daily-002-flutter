import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:daily_002_flutter/components/label.dart';
import 'package:daily_002_flutter/components/section_title.dart';
import 'package:daily_002_flutter/models/payment.dart';

class PaymentCard extends StatefulWidget {
  PaymentCard({super.key, this.payment, required this.onPressEdit});

  final VoidCallback? onPressEdit;
  Payment? payment;

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionTitle(text: "Payment"),
              IconButton(
                  onPressed: widget.onPressEdit,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Color(0xFF242424),
                  ))
            ],
          ),
          SizedBox(
            height: 80,
            child: Card(
              elevation: 5,
              child: widget.payment != null
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/mastercard.svg",
                              semanticsLabel: 'Acme Logo'),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 32.0),
                              child: Label(
                                text: widget.payment!.number_obfuscated,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(child: Label(text: "No Payment Information")),
            ),
          ),
        ],
      ),
    );
  }
}
