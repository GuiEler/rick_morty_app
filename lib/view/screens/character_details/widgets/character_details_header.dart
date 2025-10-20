import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../../domain/models/models.dart';
import '../../../../res/theme/app_colors.dart';
import '../../../../res/theme/app_text_styles.dart';

class CharacterDetailsHeader extends StatelessWidget {
  const CharacterDetailsHeader({
    super.key,
    required this.imageHeight,
    required this.character,
  });

  final double imageHeight;
  final CharacterModel character;

  @override
  Widget build(BuildContext context) => SliverList.list(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: imageHeight,
            width: imageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: character.image,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator.adaptive(
                  value: progress.progress,
                ),
              ),
              errorWidget: (context, error, stackTrace) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.neutral100),
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAlias,
                child: const Icon(
                  Icons.link_off_rounded,
                  color: AppColors.neutral100,
                  size: 24,
                ),
              ),
              errorListener: (error) {
                if (error is HttpExceptionWithStatus) {
                  debugPrint(
                    'Error with code ${error.statusCode} on uri:${error.uri} and message ${error.message}',
                  );
                }
                debugPrint('Image Exception - $error');
              },
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          character.name,
          style: AppTextStyles.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
