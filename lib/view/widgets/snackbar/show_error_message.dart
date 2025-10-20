import 'package:flutter/material.dart';

import '../../../res/theme/app_colors.dart';
import '../../../res/theme/app_text_styles.dart';
import '../../../utils/utils.dart';
import 'snackbar.dart';

void showErrorMessage({required String message}) {
  final context = NavigationUtils.appContext;
  final screenHeight = MediaQuery.sizeOf(context).height;
  final snackbar = CustomSnackBar(
    backgroundColor: AppColors.red300,
    duration: const Duration(seconds: 2),
    margin: EdgeInsets.fromLTRB(48, 0, 48, screenHeight * 0.16),
    borderRadius: 12,
    messageText: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.highlight_off_rounded,
            size: 24,
            color: AppColors.neutral0,
          ),
        ),
        Flexible(
          child: Text(
            message,
            style: AppTextStyles.bodySmall2.copyWith(color: AppColors.neutral0),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    ),
  );
  SnackbarController(snackbar).show();
}
