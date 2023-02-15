// ignore_for_file: prefer_const_constructors

import 'package:daily_002_flutter/screens/payment/components/preview_card.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:daily_002_flutter/components/scrollable_form.dart';
import 'package:daily_002_flutter/components/styled_button.dart';
import 'package:daily_002_flutter/components/styled_text_form_container.dart';
import 'package:daily_002_flutter/models/payment.dart';
import 'package:daily_002_flutter/theme/style.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key, this.payment});

  Payment? payment;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController holderController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  TextEditingController expirationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    onSubmit() {
      // Validate returns true if the form is valid, or false otherwise.
      if (formKey.currentState!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();

        Navigator.pop(
            context,
            Payment(
                holder: holderController.text,
                number: numberController.text,
                cvv: cvvController.text,
                expiration: expirationController.text));
      }
    }

    return Scaffold(
      appBar: appBar("Add payment method"),
      body: ScrollableForm(
        formKey: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PreviewCard(
              holder: holderController,
              number: numberController,
              expiration: expirationController,
            ),
            SizedBox(height: 32),
            StyledTextFormField(
              controller: holderController,
              label: "Holder Name",
              validator: holderValidator,
            ),
            StyledTextFormField(
              label: "Card Number",
              controller: numberController,
              formatter: cardFormatter,
              validator: numberValidator,
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: StyledTextFormField(
                      label: "CVV",
                      controller: cvvController,
                      formatter: cvvFormatter,
                      validator: cvvValidator,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: StyledTextFormField(
                      label: "Expiration Date",
                      placeholder: "MM/AA",
                      controller: expirationController,
                      formatter: expirationFormatter,
                      validator: expirationValidator,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            StyledButton(
                text: widget.payment == null ? "Add new card" : "Update card",
                onPressed: onSubmit)
          ],
        ),
      ),
    );
  }
}

var cardFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var cvvFormatter = MaskTextInputFormatter(
    mask: '####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var expirationFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

String? holderValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Holder name is required";
  }
  return null;
}

String? numberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Card number is required";
  }
  if (value.replaceAll(" ", "").replaceAll("*", "").length != 16) {
    return "Provide a valid card number";
  }
  return null;
}

String? cvvValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "CVV is required";
  }
  if (value.replaceAll(" ", "").replaceAll("*", "").length < 3) {
    return "Provide a valid CVV";
  }
  return null;
}

String? expirationValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Required";
  }
  return null;
}
