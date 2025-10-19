import 'package:flutter/material.dart';

import '../main/routes.dart';
import '../utils/utils.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> startSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    NavigationUtils.clearToPage(AppRoutes.characters.path);
  }
}
