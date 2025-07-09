import 'package:flutter/material.dart';

class ImageLayersCombination extends StatelessWidget {
  final VoidCallback? onPressed;
  final String imageUrl;

  const ImageLayersCombination({
    super.key,
    this.onPressed,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          ),
          Image.asset(imageUrl, height: 100, width: 100),
        ],
      ),
    );
  }
}
