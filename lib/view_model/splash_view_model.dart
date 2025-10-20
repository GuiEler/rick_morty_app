import '../main/routes.dart';
import '../utils/utils.dart';

class SplashViewModel {
  Future<void> startSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    NavigationUtils.clearToPage(AppRoutes.characters.path);
  }
}
