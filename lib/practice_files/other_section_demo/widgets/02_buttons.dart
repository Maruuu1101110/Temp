import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final String? buttonText;
  final double? textSize;
  final double? borderRadius;
  final Color? buttonColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? foregroundColor;
  final Function() onButtonPressed;
  const AddButton({
    super.key,
    this.buttonText,
    required this.onButtonPressed,
    this.buttonColor,
    this.foregroundColor,
    this.borderRadius,
    this.buttonWidth,
    this.buttonHeight,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? MediaQuery.of(context).size.width,
      height: buttonHeight ?? 45,
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          shape: WidgetStateOutlinedBorder.resolveWith((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 6),
            );
          }),
        ),
        child: Text(
          buttonText ?? "Button",
          style: TextStyle(
            fontSize: textSize ?? 16,
            color: foregroundColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
