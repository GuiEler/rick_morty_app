import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../domain/errors/errors.dart';
import '../utils/utils.dart';
import 'factories/screens/screens.dart';

enum AppRoutes {
  splash(name: 'Splash', path: '/'),
  characters(name: 'Characters', path: '/characters'),
  characterDetail(name: 'CharacterDetail', path: '/characters/:id');

  final String name;
  final String path;
  const AppRoutes({
    required this.name,
    required this.path,
  });
}

mixin AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: 'Main Navigator');

  static final GoRouter routerConfig = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.splash.path,
    observers: _getNavigatorObservers(),
    routes: [
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: makeSplashScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.characters.path,
        name: AppRoutes.characters.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: makeCharactersScreen(),
        ),
        routes: [
          GoRoute(
            path: ':id',
            name: AppRoutes.characterDetail.name,
            pageBuilder: (context, state) {
              final idParam = state.pathParameters['id'];
              final characterId = int.tryParse(idParam ?? '');
              if (characterId == null) {
                return MaterialPage(
                  key: state.pageKey,
                  child: makeNavigationErrorScreen(
                    error: const UnexpectedError(detail: 'Invalid character ID'),
                  ),
                );
              }
              return MaterialPage(
                key: state.pageKey,
                child: makeCharacterDetailsScreen(characterId: characterId),
              );
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: makeNavigationErrorScreen(error: state.error),
    ),
  );

  static List<NavigatorObserver> _getNavigatorObservers() {
    final List<NavigatorObserver> navigatorObservers = [ObserverUtils.routeObserver];
    return navigatorObservers;
  }
}
