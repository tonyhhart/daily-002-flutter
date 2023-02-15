import 'package:flutter/widgets.dart';
import 'package:daily_002_flutter/screens/checkout/checkout_screen.dart';
import 'package:daily_002_flutter/screens/shipping_address/shipping_address_screen.dart';
import 'package:daily_002_flutter/screens/payment/payment_screen.dart';
import 'package:daily_002_flutter/screens/success/success_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => CheckoutScreen(),
  "/shipping-address": (BuildContext context) => ShippingAddressScreen(),
  "/payment": (BuildContext context) => PaymentScreen(),
  "/success": (BuildContext context) => SuccessScreen(),
};
