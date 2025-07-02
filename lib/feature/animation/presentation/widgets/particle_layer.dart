import 'dart:math';
import 'package:collider_loading/feature/animation/domain/model/particle_model.dart';
import 'package:collider_loading/feature/animation/presentation/painters/particle_painter.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class ParticleLayer extends StatefulWidget {
  final VoidCallback? onCollision;

  const ParticleLayer({super.key, this.onCollision});

  @override
  State<ParticleLayer> createState() => _ParticleLayerState();
}

class _ParticleLayerState extends State<ParticleLayer> with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  final List<Particle> _particles = [];
  final Random _random = Random();
  Duration _elapsed = Duration.zero;
  bool _collisionTriggered = false;
  bool _spawnLeftNext = true;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    final dt = (elapsed - _elapsed).inMilliseconds / 200;
    _elapsed = elapsed;

    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    setState(() {
      _particles.removeWhere((p) => p.position.dx < -100 || p.position.dx > width + 100);

      final centerX = width / 2;

      final leftMaxX = _particles
          .where((p) => p.fromLeft)
          .fold<double>(-double.infinity, (maxX, p) => p.position.dx > maxX ? p.position.dx : maxX);

      final rightMinX = _particles
          .where((p) => !p.fromLeft)
          .fold<double>(double.infinity, (minX, p) => p.position.dx < minX ? p.position.dx : minX);

      for (var p in _particles) {
        final dx = p.speed * (p.fromLeft ? 1 : -1) * dt * 100;
        final newX = p.position.dx + dx;
        p.position = Offset(newX, p.position.dy);
      }

      if (!_collisionTriggered && _elapsed >= const Duration(seconds: 8)) {
        const collisionThreshold = 16.0;

        final leftParticles = _particles.where((p) => p.fromLeft).toList();
        final rightParticles = _particles.where((p) => !p.fromLeft).toList();

        for (final lp in leftParticles) {
          for (final rp in rightParticles) {
            final yClose = (lp.position.dy - rp.position.dy).abs() < 20;
            final xClose = (lp.position.dx - rp.position.dx).abs() < collisionThreshold;
            final centerAligned = ((lp.position.dx + rp.position.dx) / 2 - centerX).abs() < 20;

            if (yClose && xClose && centerAligned) {
              _collisionTriggered = true;
              widget.onCollision?.call();
              _ticker.stop();
              break;
            }
          }
          if (_collisionTriggered) break;
        }
      }

      while (!_collisionTriggered && _random.nextDouble() < _spawnProbability) {
        final centerY = height / 2;
        const tubeHeight = 52.0;
        const spacing = 24.0;

        final yMin = centerY - spacing + 5;
        final yMax = centerY + spacing + tubeHeight - 5;

        final spawnLeft = _spawnLeftNext;

        if (spawnLeft) {
          if (rightMinX - (-50) < 30) break;
        } else {
          if ((width + 50) - leftMaxX < 30) break;
        }

        final x = spawnLeft ? -50 : width + 50;
        final y = yMin + _random.nextDouble() * (yMax - yMin);

        _particles.add(
          Particle(
            position: Offset(x.toDouble(), y.toDouble()),
            speed: 0.8 + _elapsed.inSeconds * 0.03,
            radius: 3 + _random.nextDouble() * 2,
            fromLeft: spawnLeft,
            brightness: 0.8 + _random.nextDouble() * 0.2,
          ),
        );

        _spawnLeftNext = !_spawnLeftNext;
      }
    });
  }

  double get _spawnProbability {
    final t = _elapsed.inMilliseconds / 1000;
    return (0.02 + (t * 0.008)).clamp(0.02, 0.25);
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
