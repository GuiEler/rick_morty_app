import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main/di/di.dart';

mixin NavigationUtils {
  static bool testMode = false;
  static GoRouter _routerConfig = getIt<GoRouter>();
  static GlobalKey<NavigatorState> get navigatorKey => _routerConfig.routerDelegate.navigatorKey;
  static BuildContext get appContext => navigatorKey.currentContext!;

  static set routerConfig(GoRouter routerConfig) => _routerConfig = routerConfig;

  static void back<T>({T? result, int? close}) {
    if (!testMode) {
      final GoRouterDelegate routerDelegate = _routerConfig.routerDelegate;
      for (int i = 0; i < (close ?? 1); i++) {
        if (routerDelegate.canPop()) {
          _routerConfig.pop(result);
        }
      }
    }
  }

  static Future<dynamic>? toPage(String path, {dynamic arguments}) => testMode
      ? null
      : _routerConfig.push(
          path,
          extra: arguments,
        );

  static void clearToPage(String path, {dynamic arguments}) => testMode
      ? null
      : _routerConfig.pushReplacement(
          path,
          extra: arguments,
        );

  static void backToPage<T>(String path, {T? result}) {
    if (testMode) {
      return;
    }
    final GoRouterDelegate routerDelegate = _routerConfig.routerDelegate;
    List<RouteMatchBase> matches = routerDelegate.currentConfiguration.matches;
    while (_routerConfig.canPop()) {
      final routeMatch = matches.last;
      if (routeMatch.route is ShellRouteBase) {
        routerDelegate.currentConfiguration = routerDelegate.currentConfiguration.remove(routeMatch);
        matches = routerDelegate.currentConfiguration.matches;
        continue;
      }
      if (routeMatch.route is GoRoute) {
        final goRoute = routeMatch.route as GoRoute;
        if (goRoute.path == path) {
          break;
        }
        if (!routerDelegate.canPop()) {
          break;
        }
        routerDelegate.pop(result);
      }
      matches = routerDelegate.currentConfiguration.matches;
    }
  }

  static String get currentPath {
    final GoRouterDelegate routerDelegate = _routerConfig.routerDelegate;
    final RouteBase route = routerDelegate.currentConfiguration.routes.last;
    return route is GoRoute ? route.path : '';
  }
}
