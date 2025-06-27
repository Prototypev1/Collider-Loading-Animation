import 'package:collider_loading/feature/animation/domain/cubit/loading_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreenCubit extends Cubit<LoadingScreenState> {
  LoadingScreenCubit() : super(const LoadingScreenState.initial()) {}
}
