import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:collider_loading/di/di.dart';
import 'package:collider_loading/feature/animation/domain/cubit/loading_screen_cubit.dart';
import 'package:collider_loading/feature/animation/domain/cubit/loading_screen_state.dart';
import 'package:collider_loading/feature/animation/presentation/widgets/background_gradient.dart';
import 'package:collider_loading/feature/animation/presentation/widgets/collision_tube.dart';
import 'package:collider_loading/feature/animation/presentation/widgets/particle_layer.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late final LoadingScreenCubit _loadingScreenCubit;
  double _opacity = 0.0;

  bool _collisionTriggered = false;
  double _flashOpacity = 0.0;
  double _flashScale = 1.0;
  double _blackoutOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _loadingScreenCubit = getIt<LoadingScreenCubit>();

    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() => _opacity = 1.0);
    });
  }

  void _triggerCollision() async {
    setState(() {
      _collisionTriggered = true;
      _flashOpacity = 1.0;
      _flashScale = 1.0;
    });

    for (int i = 0; i < 15; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() => _flashScale += 0.2);
    }

    setState(() {
      _flashOpacity = 0.0;
      _blackoutOpacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalMargin = screenWidth / 10;

    const tubeHeight = 52.0;
    const spacing = 24.0;

    final centerY = screenHeight / 2;
    final upperTubeTop = centerY - spacing - tubeHeight;
    final lowerTubeTop = centerY + spacing;

    return Scaffold(
      body: BlocConsumer<LoadingScreenCubit, LoadingScreenState>(
        bloc: _loadingScreenCubit,
        listener: (_, __) {},
        builder: (_, __) {
          return Stack(
            children: [
              const Positioned.fill(child: BackgroundGradient()),
              Positioned(
                top: upperTubeTop,
                left: horizontalMargin,
                right: horizontalMargin,
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                  child: const CollisionTube(position: CollisionTubePosition.upper),
                ),
              ),
              Positioned(
                top: lowerTubeTop,
                left: horizontalMargin,
                right: horizontalMargin,
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                  child: const CollisionTube(position: CollisionTubePosition.lower),
                ),
              ),
              ParticleLayer(onCollision: _triggerCollision),
              if (_collisionTriggered)
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: _flashOpacity,
                    duration: const Duration(milliseconds: 200),
                    child: Transform.scale(scale: _flashScale, child: Container(color: Colors.white)),
                  ),
                ),
              if (_blackoutOpacity > 0)
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: _blackoutOpacity,
                    duration: const Duration(milliseconds: 1500),
                    child: Container(color: Colors.black),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
