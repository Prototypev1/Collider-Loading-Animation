import 'package:collider_loading/core/presentation/common/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MainPageContainer extends StatelessWidget {
  final Widget child;
  const MainPageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
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
  }
}
