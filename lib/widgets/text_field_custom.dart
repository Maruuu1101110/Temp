import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure;
  final String label;
  final String hintText;
  final Widget suffix;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.obscure,
    required this.label,
    required this.hintText,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        suffixIcon: suffix,
        border: OutlineInputBorder(),
      ),
    );
  }
}
