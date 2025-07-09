import 'package:collider_loading/core/presentation/common/styles/custom_text_styles.dart';
import 'package:collider_loading/feature/contact/presentation/widgets/image_layers_combination.dart';
import 'package:flutter/material.dart';

class SocialContactColumn extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onPressed;
  final String description;

  const SocialContactColumn({
    super.key,
    required this.imageUrl,
    required this.description,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double itemWidth = constraints.maxWidth / 2 - 20;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageLayersCombination(
              imageUrl: imageUrl,
              onPressed: onPressed ?? () {},
            ),
            const SizedBox(height: 40),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: itemWidth),
              child: Text(
                description,
                style: CustomTextStyles.of(context).regular16.apply(color: Colors.white),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        );
      },
    );
  }
}
