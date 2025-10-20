import 'package:flutter/material.dart';

import '../../../../main/routes.dart';
import '../../../../utils/utils.dart';
import '../../res/theme/app_colors.dart';
import '../../res/theme/app_text_styles.dart';
import '../helpers/helpers.dart';
import '../widgets/widgets.dart';

class NavigationErrorScreen extends StatelessWidget {
  const NavigationErrorScreen({super.key, required this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(title: Text(R.strings.ocurredAnError)),
    body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  R.strings.navigationErrorMsg,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium1,
                ),
              ),
              ElevatedButton(
                onPressed: () => NavigationUtils.clearToPage(AppRoutes.characters.path),
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
                        Icons.home_rounded,
                        size: 24,
                        color: AppColors.neutral0,
                      ),
                    ),
                    Text(R.strings.goBackToHome),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
