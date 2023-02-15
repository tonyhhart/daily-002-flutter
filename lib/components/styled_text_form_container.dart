import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledTextFormField extends StatelessWidget {
  const StyledTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.placeholder,
    this.icon,
    this.validator,
    this.formatter,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final String? placeholder;
  final IconData? icon;
  final String? Function(String?)? validator;
  final TextInputFormatter? formatter;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormContainer(
      label: label,
      child: TextFormField(
        controller: controller,
        inputFormatters: formatter != null ? [formatter!] : null,
        decoration: TextFormDecoration(placeholder ?? "", icon),
        // The validator receives the text that the user has entered.
        validator: validator,
        keyboardType: keyboardType ?? TextInputType.text,
        textCapitalization: TextCapitalization.words,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
          color: Color(0xFF090723),
        )),
      ),
    );
  }
}

class TextFormContainer extends StatelessWidget {
  const TextFormContainer({
    super.key,
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: 16, color: const Color(0XFFB4B4B4)),
          ),
        ),
        SizedBox(
          child: child,
          height: 75,
        ),
      ],
    );
  }
}

InputDecoration TextFormDecoration(label, icon) {
  return InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(color: Color(0XFFB4B4B4)),
      errorStyle: GoogleFonts.poppins(),
      prefixIcon:
          icon != null ? Icon(icon, color: const Color(0XFFB4B4B4)) : null,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      border: const OutlineInputBorder());
}
