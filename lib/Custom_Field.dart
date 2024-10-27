import 'package:flutter/material.dart';

class CustomerFormField extends StatelessWidget {
  final String hintText;
  final double height;
  final RegExp validationRegularExpression;
  final bool obscureText;
  final void Function(String?)onSaved;

  const CustomerFormField({
    super.key,
    required this.hintText,
    required this.height,
    required this.validationRegularExpression,
    required this.onSaved,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onSaved: onSaved,
        obscureText: obscureText,
        validator: (value) {
          if (value != null && validationRegularExpression.hasMatch(value)) {
            return null;
          }
          return "Enter a valid ${hintText.toLowerCase()}";
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
