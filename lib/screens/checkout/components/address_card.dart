import 'package:flutter/material.dart';
import 'package:daily_002_flutter/components/label.dart';
import 'package:daily_002_flutter/components/header_title.dart';
import 'package:daily_002_flutter/components/section_title.dart';
import 'package:daily_002_flutter/models/address.dart';

class AddressCard extends StatefulWidget {
  AddressCard({super.key, this.address, required this.onPressEdit});

  final VoidCallback? onPressEdit;
  Address? address;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
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
              SectionTitle(text: "Shipping Address"),
              IconButton(
                  onPressed: widget.onPressEdit,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Color(0xFF242424),
                  ))
            ],
          ),
          SizedBox(
            height: 100,
            child: Card(
              elevation: 5,
              child: widget.address != null
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeaderTitle(
                            text: widget.address!.fullName,
                          ),
                          Label(
                            text:
                                "${widget.address!.address}, ${widget.address!.zipCode}",
                          ),
                        ],
                      ),
                    )
                  : Center(child: Label(text: "No Address")),
            ),
          ),
        ],
      ),
    );
  }
}
