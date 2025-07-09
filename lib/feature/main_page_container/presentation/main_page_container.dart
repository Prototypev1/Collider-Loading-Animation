import 'package:collider_loading/core/presentation/common/widgets/app_bar/custom_app_bar.dart';
import 'package:collider_loading/di/di.dart';
import 'package:collider_loading/feature/main_page_container/domain/cubit/main_page_cubit.dart';
import 'package:collider_loading/feature/main_page_container/domain/cubit/main_page_state.dart';
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
  void initState() {
    super.initState();
    _cubit = getIt<MainPageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              top: kToolbarHeight,
              child: BlocBuilder<MainPageCubit, MainPageState>(
                bloc: _cubit,
                builder: (context, state) {
                  if (state is MainPageStateInitial) {
                    return widget.child;
                  } else if (state is MainPageStateLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is MainPageStateReady) {
                    return Center(child: Text('Page ready', style: TextStyle(color: Colors.white)));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(
                page: _cubit.state.page,
                onPageChanged: _cubit.changePage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
