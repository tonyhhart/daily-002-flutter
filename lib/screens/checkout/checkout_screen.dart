import 'package:flutter/material.dart';
import 'package:daily_002_flutter/components/styled_button.dart';
import 'package:daily_002_flutter/models/address.dart';
import 'package:daily_002_flutter/models/payment.dart';
import 'package:daily_002_flutter/screens/checkout/components/address_card.dart';
import 'package:daily_002_flutter/screens/checkout/components/payment_card.dart';
import 'package:daily_002_flutter/screens/payment/payment_screen.dart';
import 'package:daily_002_flutter/screens/shipping_address/shipping_address_screen.dart';
import 'package:daily_002_flutter/screens/success/success_screen.dart';
import 'package:daily_002_flutter/theme/style.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Address? address;
  Payment? payment;

  Future<void> navigateToShippingAddress() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ShippingAddressScreen(
                address: address,
              )),
    );

    if (mounted && result != null) {
      setState(() {
        address = result as Address;
      });
    }
  }

  Future<void> navigateToPayment() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PaymentScreen(
                payment: payment,
              )),
    );

    if (mounted && result != null) {
      setState(() {
        payment = result as Payment;
      });
    }
  }

  navigateToSuccess() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SuccessScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Check out"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            AddressCard(
              address: address,
              onPressEdit: navigateToShippingAddress,
            ),
            PaymentCard(
              payment: payment,
              onPressEdit: navigateToPayment,
            ),
            StyledButton(
              text: "Place order",
              onPressed:
                  address != null && payment != null ? navigateToSuccess : null,
            ),
          ],
        ),
      ),
    );
  }
}
