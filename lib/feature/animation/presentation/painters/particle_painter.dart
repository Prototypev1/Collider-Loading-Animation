import 'package:collider_loading/feature/animation/domain/model/particle_model.dart';
import 'package:flutter/material.dart';

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint =
          Paint()
            ..shader = RadialGradient(
              colors: [Colors.white.withValues(alpha: particle.brightness), Colors.transparent],
            ).createShader(Rect.fromCircle(center: particle.position, radius: particle.radius * 2));

      canvas.drawCircle(particle.position, particle.radius * 2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
