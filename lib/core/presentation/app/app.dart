import 'package:collider_loading/core/domain/repository/theme_repository.dart';
import 'package:collider_loading/di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = getIt<ThemeRepository>().buildTheme();
    return BlocProvider(
      //  create: (_) => getIt.get<AuthCubit>(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          theme: theme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          //routerConfig: getIt.get<RouterConfiguration>().router,
          title: 'wont be an app',
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
