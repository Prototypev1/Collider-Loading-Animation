import 'package:collider_loading/core/domain/repository/theme_repository.dart';
import 'package:collider_loading/core/presentation/navigation/router_configuration.dart';
import 'package:collider_loading/feature/animation/domain/cubit/loading_screen_cubit.dart';
import 'package:collider_loading/feature/main_page_container/domain/cubit/main_page_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
Future<void> initDI() async {
  await _registerUtils();
  _registerCubits();
}

Future<void> _registerUtils() async {
  getIt
    ..registerSingleton<ThemeRepository>(ThemeRepository())
    ..registerSingleton<RouterConfiguration>(RouterConfiguration());
}

void _registerCubits() {
  getIt
    ..registerLazySingleton<LoadingScreenCubit>(() => LoadingScreenCubit())
    ..registerLazySingleton<MainPageCubit>(() => MainPageCubit());
}
