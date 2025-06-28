import 'dart:math';

import 'package:collider_loading/feature/animation/domain/model/glow_zone_model.dart';
import 'package:collider_loading/feature/animation/domain/model/particle_model.dart';
import 'package:collider_loading/feature/animation/presentation/painters/particle_painter.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class ParticleLayer extends StatefulWidget {
  const ParticleLayer({super.key});

  @override
  State<ParticleLayer> createState() => _ParticleLayerState();
}

class _ParticleLayerState extends State<ParticleLayer> with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  final List<Particle> _particles = [];
  final Random _random = Random();
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  List<GlowZone> getGlowZones(double yMin, double yMax) {
    return _particles
        .where((p) => p.position.dy >= yMin && p.position.dy <= yMax)
        .map((p) => GlowZone(p.position.dx, p.brightness))
        .toList();
  }

  void _onTick(Duration elapsed) {
    final dt = (elapsed - _elapsed).inMilliseconds / 1000;
    _elapsed = elapsed;

    setState(() {
      _particles.removeWhere((p) => p.position.dx < -100 || p.position.dx > MediaQuery.of(context).size.width + 100);

      for (var p in _particles) {
        final dx = p.speed * (p.fromLeft ? 1 : -1) * dt * 100;
        p.position = Offset(p.position.dx + dx, p.position.dy);
      }

      if (_random.nextDouble() < 0.02 + elapsed.inSeconds * 0.001) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;

        final yMin = height / 2.5;
        final yMax = height / 2 + 52;

        _particles.add(
          Particle(
            position: Offset(_random.nextBool() ? -50 : width + 50, yMin + _random.nextDouble() * (yMax - yMin - 10)),
            speed: 1.0 + _random.nextDouble() * 2.0 + elapsed.inSeconds * 0.01,
            radius: 3 + _random.nextDouble() * 2,
            fromLeft: _random.nextBool(),
            brightness: 0.8 + _random.nextDouble() * 0.2,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(child: CustomPaint(painter: ParticlePainter(_particles), size: Size.infinite));
  }
}
