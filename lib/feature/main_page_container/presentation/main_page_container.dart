import 'package:collider_loading/core/presentation/common/widgets/app_bar/custom_app_bar.dart';
import 'package:collider_loading/feature/main_page_container/domain/cubit/main_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageContainer extends StatefulWidget {
  final Widget child;
  const MainPageContainer({super.key, required this.child});

  @override
  State<MainPageContainer> createState() => _MainPageContainerState();
}

class _MainPageContainerState extends State<MainPageContainer> {
  late final MainPageCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _cubit = MainPageCubit();
        return _cubit;
      },
      child: BlocConsumer(
        listener: (context, state) {
          //might need some logic
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CustomAppBar(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
