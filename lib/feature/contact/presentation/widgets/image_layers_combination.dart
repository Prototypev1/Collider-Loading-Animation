import 'package:flutter/material.dart';

class ImageLayersCombination extends StatelessWidget {
  const ImageLayersCombination({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 100, width: 100, child: ColoredBox(color: Colors.white)),
        Image.asset('assets/images/linkedin.png', height: 100, width: 100),
      ],
    );
  }
}
