import 'package:flutter/material.dart';

class ScrollableForm extends StatelessWidget {
  const ScrollableForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.child,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: SafeArea(
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
