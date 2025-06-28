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

      final trailPaint =
          Paint()
            ..shader = LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.white.withValues(alpha: .2), Colors.transparent],
            ).createShader(Rect.fromCircle(center: particle.position, radius: particle.radius * 6));

      final trailOffset = Offset(particle.fromLeft ? -15 : 15, 0);
      canvas.drawCircle(particle.position.translate(trailOffset.dx, trailOffset.dy), particle.radius * 3, trailPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
