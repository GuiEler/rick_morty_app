import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../../domain/models/models.dart';
import '../../../../res/theme/app_colors.dart';
import '../../../../res/theme/app_text_styles.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.item,
  });

  final CharacterModel item;

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.green400, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          imageUrl: item.image,
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
      Align(
        alignment: Alignment.bottomCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(color: AppColors.neutral500.withValues(alpha: 0.9)),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    item.name,
                    style: AppTextStyles.bodySmall1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
