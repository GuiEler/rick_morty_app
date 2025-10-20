import 'package:flutter/material.dart';

import '../../../../res/app_lotties.dart';
import '../../../../res/theme/app_text_styles.dart';
import '../../../helpers/helpers.dart';
import '../../../widgets/widgets.dart';

class CharactersEmpty extends StatelessWidget {
  const CharactersEmpty({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const LottieControlledAnimation(
          lottiePath: AppLotties.rickAwake,
          duration: Duration(seconds: 2),
        ),
        Text(
          R.strings.charactersEmpty,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium1,
        ),
      ],
    ),
  );
}
