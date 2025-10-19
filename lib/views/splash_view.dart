import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../res/app_lotties.dart';
import '../viewmodels/splash_viewmodel.dart';
import 'shared/lottie_controlled_animation.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final SplashViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = GetIt.I<SplashViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.startSplash(context);
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: Center(
        child: LottieControlledAnimation(
          lottiePath: AppLotties.rick,
        ),
      ),
    ),
  );
}
