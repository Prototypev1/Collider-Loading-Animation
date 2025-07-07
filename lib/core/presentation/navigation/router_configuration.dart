import 'dart:async';
import 'dart:io';

import 'package:collider_loading/feature/animation/presentation/loading_screen.dart';
import 'package:collider_loading/feature/home/presentation/home_page.dart';
import 'package:collider_loading/feature/main_page_container/presentation/main_page_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class RouterConfiguration {
  RouterConfiguration();

  late final GoRouter _goRouter;

  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter get router => _goRouter;

  void init() {
    _goRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: '/${LoadingScreen.pageName}',
      debugLogDiagnostics: kDebugMode,
      routes: <RouteBase>[
        GoRoute(
          path: '/${LoadingScreen.pageName}',
          name: LoadingScreen.pageName,
          pageBuilder: (context, state) => _getPage(key: state.pageKey, child: const LoadingScreen()),
        ),

        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => MainPageContainer(child: child),
          routes: [
            GoRoute(
              path: '/${HomePage.pageName}',
              name: HomePage.pageName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const HomePage()),
            ),
          ],
        ),
      ],
    );
  }

  Page<dynamic> _getPage({required ValueKey<dynamic> key, required Widget child}) {
    if (kIsWeb) {
      return NoTransitionPage(key: key, child: child);
    }

    if (Platform.isAndroid) {
      return NoTransitionPage(key: key, child: child);
    } else {
      return CupertinoPage(key: key, child: child);
    }
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
