import 'package:flutter/material.dart';

import '../../../../res/theme/app_colors.dart';
import '../../../../res/theme/app_text_styles.dart';
import '../../../helpers/helpers.dart';
import '../../../widgets/widgets.dart';

class NoMoreCharacters extends StatelessWidget {
  const NoMoreCharacters({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Padding(
        padding: EdgeInsets.all(24),
        child: CustomSeparator(color: AppColors.blue300, height: 4),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
        child: Text(
          R.strings.noMoreCharacters,
          style: AppTextStyles.labelMedium1.copyWith(color: AppColors.neutral0),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
