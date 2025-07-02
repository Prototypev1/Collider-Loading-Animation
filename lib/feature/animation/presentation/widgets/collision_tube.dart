import 'package:flutter/material.dart';
import 'package:collider_loading/core/presentation/common/styles/custom_colors.dart';

enum CollisionTubePosition { upper, lower }

class CollisionTube extends StatelessWidget {
  final CollisionTubePosition position;

  const CollisionTube({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 400;
    final baseColor = CustomColors.of(context).tubeOutlineColor;
    final brightColor = baseColor.withValues(alpha: 0.95);
    final softColor = baseColor.withValues(alpha: 0.12);
    final mistColor = baseColor.withValues(alpha: 0.035);

    return SizedBox(
      width: width,
      height: 52,
      child: Stack(
        children: [
          Positioned(
            top: position == CollisionTubePosition.upper ? 10 : null,
            bottom: position == CollisionTubePosition.lower ? 10 : null,
            child: Container(
              width: width,
              height: 42,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: position == CollisionTubePosition.upper ? Alignment.topCenter : Alignment.bottomCenter,
                  end: position == CollisionTubePosition.upper ? Alignment.bottomCenter : Alignment.topCenter,
                  colors: [mistColor, Colors.transparent],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: position == CollisionTubePosition.upper ? Alignment.topCenter : Alignment.bottomCenter,
                  end: position == CollisionTubePosition.upper ? Alignment.bottomCenter : Alignment.topCenter,
                  colors: [baseColor.withValues(alpha: 0.25), baseColor.withValues(alpha: 0.12), Colors.transparent],
                  stops: const [0.0, 0.5, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcOver,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      baseColor.withValues(alpha: 0.1),
                      baseColor.withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.35, 0.65, 1.0],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: position == CollisionTubePosition.upper ? Alignment.topCenter : Alignment.bottomCenter,
            child: Container(
              height: 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.transparent, brightColor, brightColor, Colors.transparent],
                  stops: const [0.0, 0.2, 0.8, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: position == CollisionTubePosition.upper ? 5 : null,
            bottom: position == CollisionTubePosition.lower ? 5 : null,
            child: Container(
              width: width,
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.transparent, softColor, softColor, Colors.transparent],
                  stops: const [0.0, 0.25, 0.75, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
