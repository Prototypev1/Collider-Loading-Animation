import 'package:collider_loading/core/domain/repository/theme_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDI() async {
  await _registerUtils();
}

Future<void> _registerUtils() async {
  getIt.registerSingleton<ThemeRepository>(ThemeRepository());
  // ..registerSingleton<RouterConfiguration>(RouterConfiguration(getIt<LocalRepository>()))
}

// Future<void> _registerApiClient() async {
//   const flavorFromEnv = String.fromEnvironment('FLUTTER_APP_FLAVOR');
//   const appFlavor = flavorFromEnv != '' ? flavorFromEnv : 'prod';
//   await Config.init(appFlavor);

//   getIt
//     ..registerSingleton<Dio>(DioClient.getDioClient(Config.baseUri))
//     ..registerSingleton<ApiRepository>(ApiRepository(getIt.get<Dio>()));
// }
