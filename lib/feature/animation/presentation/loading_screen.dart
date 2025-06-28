import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:collider_loading/di/di.dart';
import 'package:collider_loading/feature/animation/domain/cubit/loading_screen_cubit.dart';
import 'package:collider_loading/feature/animation/domain/cubit/loading_screen_state.dart';
import 'package:collider_loading/feature/animation/domain/model/glow_zone_model.dart';
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

  final List<GlowZone> upperGlowZones = [GlowZone(0.2, 0.6), GlowZone(0.5, 0.9)];

  final List<GlowZone> lowerGlowZones = [GlowZone(0.35, 0.5), GlowZone(0.75, 0.7)];

  @override
  void initState() {
    super.initState();
    _loadingScreenCubit = getIt<LoadingScreenCubit>();

    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        _opacity = 1.0;
      });
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
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(child: BackgroundGradient()),
              const ParticleLayer(),
              Positioned(
                top: upperTubeTop,
                left: horizontalMargin,
                right: horizontalMargin,
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                  child: CollisionTube(position: CollisionTubePosition.upper, glowZone: upperGlowZones),
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
                  child: CollisionTube(position: CollisionTubePosition.lower, glowZone: lowerGlowZones),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
