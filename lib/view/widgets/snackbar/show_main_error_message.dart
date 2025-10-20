import 'package:flutter/material.dart';

import '../../../res/theme/app_colors.dart';
import '../../../utils/utils.dart';
import 'snackbar.dart';

void showMainErrorMessage({bool useExpandedVersion = false, required String errorMessage}) {
  final context = NavigationUtils.appContext;
  final double appBarHeight = AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight;
  final snackbar = CustomSnackBar(
    snackPosition: SnackPosition.top,
    snackStyle: useExpandedVersion ? SnackStyle.grounded : SnackStyle.floating,
    padding: EdgeInsets.fromLTRB(16, useExpandedVersion ? 32 : 16, 16, 16),
    margin: EdgeInsets.only(top: useExpandedVersion ? 0 : appBarHeight),
    backgroundColor: AppColors.gold400,
    onTap: (_) => SnackbarController.closeCurrentSnackbar(),
    duration: const Duration(seconds: 2),
    messageText: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.error_outline_rounded,
                color: AppColors.neutral500,
                size: 24,
              ),
            ),
            Flexible(
              child: Text(
                errorMessage,
                style: Theme.of(NavigationUtils.appContext).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    ),
  );
  SnackbarController(snackbar).show();
}
