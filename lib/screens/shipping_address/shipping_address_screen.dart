import 'package:daily_002_flutter/components/scrollable_form.dart';
import 'package:daily_002_flutter/components/styled_button.dart';
import 'package:daily_002_flutter/components/styled_text_form_container.dart';
import 'package:daily_002_flutter/models/address.dart';
import 'package:daily_002_flutter/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ShippingAddressScreen extends StatefulWidget {
  ShippingAddressScreen({super.key, this.address});

  Address? address;

  @override
  _ShippingAddressScreenState createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController zipCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.address?.fullName ?? "";
    addressController.text = widget.address?.address ?? "";
    zipCodeController.text = widget.address?.zipCode ?? "";
  }

  @override
  Widget build(BuildContext context) {
    onSubmit() {
      // Validate returns true if the form is valid, or false otherwise.
      if (formKey.currentState!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();

        Navigator.pop(
            context,
            Address(
                fullName: fullNameController.text,
                address: addressController.text,
                zipCode: zipCodeController.text));
      }
    }

    return Scaffold(
      appBar: appBar("Add shipping address"),
      body: ScrollableForm(
        formKey: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StyledTextFormField(
              controller: fullNameController,
              label: "Full Name",
              validator: fullNameValidator,
            ),
            StyledTextFormField(
              controller: addressController,
              label: "Address",
              validator: addressValidator,
            ),
            StyledTextFormField(
              controller: zipCodeController,
              label: "Zipcode (Postal Code)",
              validator: zipCodeValidator,
              keyboardType: TextInputType.number,
              formatter: zipCodeFormatter,
            ),
            SizedBox(height: 16),
            StyledButton(
                text:
                    widget.address == null ? "Save address" : "Update address",
                onPressed: onSubmit)
          ],
        ),
      ),
    );
  }
}

var zipCodeFormatter = MaskTextInputFormatter(
    mask: '#####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

String? fullNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Full name is required";
  }
  return null;
}

String? addressValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Address is required";
  }
  return null;
}

String? zipCodeValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Zipcode is required";
  }
  return null;
}
