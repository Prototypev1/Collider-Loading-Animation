import 'dart:async';
import 'dart:developer';

import 'package:collider_loading/di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  _initLogger();

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    await initDI();
    //  getIt.get<RouterConfiguration>().init();

    runApp(
      EasyLocalization(
        // assetLoader: const CodegenLoader(),
        supportedLocales: const [Locale('en')],
        path: 'assets/localization',
        fallbackLocale: const Locale('en'),
        child: await builder(),
      ),
    );
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}

void _initLogger() {
  // Log.tag = '';

  // Uncomment if you want simple logging
  // Log.printer = null;
}
