import 'package:collider_loading/core/domain/cubit/app/app_state.dart';
import 'package:collider_loading/core/domain/repository/theme_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  //still nothing here
  AppCubit(this._themeRepository) : super(const AppState.initial());

  // ignore: unused_field
  final ThemeRepository _themeRepository;
}
