import 'package:flutter/material.dart';

import '../../res/theme/app_colors.dart';
import '../../res/theme/app_text_styles.dart';
import '../helpers/helpers.dart';

class OnErrorReloadButton extends StatelessWidget {
  const OnErrorReloadButton({
    super.key,
    required this.reloadFunction,
    this.errorMessage,
  });

  final VoidCallback reloadFunction;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Text(
            errorMessage ?? R.strings.unexpectedError,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium1,
          ),
        ),
        ElevatedButton(
          onPressed: reloadFunction,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.refresh_rounded,
                  size: 24,
                  color: AppColors.neutral0,
                ),
              ),
              Text(R.strings.tryAgain),
            ],
          ),
        ),
      ],
    ),
  );
}
