import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final double? scale;
  const CustomImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      scale: scale,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
    );
  }
}
