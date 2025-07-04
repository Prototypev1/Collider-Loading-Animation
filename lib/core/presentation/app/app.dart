import 'package:collider_loading/core/domain/repository/theme_repository.dart';
import 'package:collider_loading/core/presentation/navigation/router_configuration.dart';
import 'package:collider_loading/di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO(Marko): Add bloc provider here
    final theme = getIt<ThemeRepository>().buildTheme();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        theme: theme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: getIt.get<RouterConfiguration>().router,
        title: 'Loading Animation',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
