import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../res/app_lotties.dart';
import '../../view_model/splash_view_model.dart';
import '../widgets/lottie_controlled_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = GetIt.I<SplashViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.startSplash();
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: Center(
        child: LottieControlledAnimation(
          lottiePath: AppLotties.rickDrunk,
          animationHeightFactor: 0.5,
          duration: Duration(seconds: 2),
        ),
      ),
    ),
  );
}
