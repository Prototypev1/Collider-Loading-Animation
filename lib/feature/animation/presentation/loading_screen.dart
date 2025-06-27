import 'package:collider_loading/di/di.dart';
import 'package:collider_loading/feature/animation/domain/cubit/loading_screen_cubit.dart';
import 'package:collider_loading/feature/animation/domain/cubit/loading_screen_state.dart';
import 'package:collider_loading/feature/animation/presentation/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late final LoadingScreenCubit _loadingScreenCubit;

  @override
  void initState() {
    super.initState();
    _loadingScreenCubit = getIt<LoadingScreenCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<LoadingScreenCubit, LoadingScreenState>(
          bloc: _loadingScreenCubit,
          builder: (BuildContext context, state) {
            return Stack(children: [BackgroundGradient()]);
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
