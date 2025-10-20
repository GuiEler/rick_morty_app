import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../res/app_lotties.dart';

class CharactersLoading extends StatelessWidget {
  const CharactersLoading({super.key, this.height = 120});
  final double height;

  @override
  Widget build(BuildContext context) => Center(
    child: LottieBuilder.asset(
      AppLotties.rickBodybuilder,
      height: height,
      fit: BoxFit.fitHeight,
    ),
  );
}
