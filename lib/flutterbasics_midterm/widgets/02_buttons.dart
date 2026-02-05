import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final String? text;
  final Function()? onPress;
  final double? width;
  final double? height;
  final Color? foregroundColor;
  final double? fontSize;
  final bool? enabled;
  final Gradient? gradient;
  final Color? color;
  const CustomButtons({
    super.key,
    this.text,
    this.onPress,
    this.width,
    this.height,
    this.foregroundColor,
    this.fontSize,
    this.enabled,
    this.gradient,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration;
    if (!(enabled ?? true)) {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(25, 26, 46, 1),
            Color.fromRGBO(23, 22, 40, 1),
          ],
        ),
      );
    } else if (gradient != null) {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: gradient,
      );
    } else {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color.fromRGBO(183, 145, 248, 1), width: 1),
        color: color ?? Color.fromRGBO(116, 102, 234, 1),
      );
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: width,
      height: height,
      decoration: decoration,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        onPressed: enabled ?? true ? onPress : null,
        child: Text(
          text ?? "CustomButton",
          style: TextStyle(
            color: foregroundColor ?? Colors.white70,
            fontSize: fontSize ?? 16,
          ),
        ),
      ),
    );
  }
}
