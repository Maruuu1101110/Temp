import 'package:flutter/material.dart';

class AddImage extends StatelessWidget {
  final String imagePath;
  final double imageWidth;
  final double imageHeight;
  const AddImage({
    super.key,
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: imageWidth,
      height: imageHeight,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.broken_image_outlined);
      },
    );
  }
}
