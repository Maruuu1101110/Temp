import 'package:flutter/material.dart';

class AddTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String textLabel;
  final bool? obsText;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final Function(String)? onTextChanged;
  const AddTextFormField({
    super.key,
    required this.textController,
    required this.textLabel,
    this.hintText,
    this.onTextChanged,
    this.prefixIcon,
    this.suffixWidget,
    this.obsText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obsText ?? false,
      decoration: InputDecoration(
        label: Text(textLabel),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Colors.black12,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black45),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixWidget,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
