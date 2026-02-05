import 'package:flutter/material.dart';

class CustomTextfield1 extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hinText;
  final IconData? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool? obs;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRad;
  final double? borderWidth;
  final Function(String)? onChanged;
  const CustomTextfield1({
    super.key,
    required this.controller,
    this.label,
    this.hinText,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.backgroundColor,
    this.borderColor,
    this.borderRad,
    this.borderWidth,
    this.obs,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obs ?? false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(label ?? ""),
        labelStyle: TextStyle(color: Colors.white70, fontSize: 14),
        hintText: hinText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Color.fromRGBO(185, 145, 244, 1))
            : null,
        prefix: prefix,
        suffixIcon: suffix,
        filled: true,
        fillColor: backgroundColor ?? Colors.black54,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRad ?? 12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRad ?? 8),
          borderSide: BorderSide(
            width: borderWidth ?? 1,
            color: borderColor ?? Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRad ?? 12),
          borderSide: BorderSide(
            width: borderWidth ?? 1,
            color: Colors.redAccent,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
