import 'dart:ui';

class Particle {
  Offset position;
  double speed;
  double radius;
  bool fromLeft;
  double brightness;

  Particle({
    required this.position,
    required this.speed,
    required this.radius,
    required this.fromLeft,
    required this.brightness,
  });
}
