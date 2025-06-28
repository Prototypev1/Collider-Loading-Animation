import 'package:collider_loading/feature/animation/domain/model/glow_zone_model.dart';
import 'package:collider_loading/feature/animation/presentation/widgets/collision_tube.dart';
import 'package:flutter/material.dart';

class GlowPainter extends CustomPainter {
  final List<GlowZone> glowZones;
  final Color color;
  final CollisionTubePosition position;

  GlowPainter({required this.glowZones, required this.color, required this.position});

  @override
  void paint(Canvas canvas, Size size) {
    for (final glow in glowZones) {
      final x = glow.x * size.width;
      final y = position == CollisionTubePosition.upper ? 5.0 : size.height - 5.0;

      final radius = 20 + glow.strength * 25;

      final gradient = RadialGradient(
        colors: [color.withValues(alpha: glow.strength.clamp(0.2, 1.0)), Colors.transparent],
        stops: const [0.0, 1.0],
      );

      final paint =
          Paint()
            ..shader = gradient.createShader(Rect.fromCircle(center: Offset(x, y), radius: radius))
            ..blendMode = BlendMode.plus;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
