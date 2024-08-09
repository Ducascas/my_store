import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: 100,
      height: 100,
    );
  }
}
