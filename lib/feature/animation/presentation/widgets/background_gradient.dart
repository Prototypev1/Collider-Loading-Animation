import 'package:collider_loading/core/presentation/common/styles/custom_colors.dart';
import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.of(context).backgroundStartGradient,
            CustomColors.of(context).backgroundEndGradient,
          ],
        ),
      ),
    );
  }
}
