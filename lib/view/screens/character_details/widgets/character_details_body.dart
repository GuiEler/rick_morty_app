import 'package:flutter/material.dart';

import '../../../../domain/models/models.dart';
import '../../../../res/theme/app_colors.dart';
import '../../../../res/theme/app_text_styles.dart';
import '../../../helpers/helpers.dart';

class CharacterDetailsBody extends StatelessWidget {
  const CharacterDetailsBody({
    super.key,
    required this.character,
    required this.episodeList,
  });

  final CharacterModel character;
  final List<EpisodeModel> episodeList;

  @override
  Widget build(BuildContext context) => DecoratedSliver(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      color: AppColors.neutral500,
    ),
    sliver: SliverPadding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.paddingOf(context).bottom + 24),
      sliver: SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.neutral400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      R.strings.aboutCharacter,
                      style: AppTextStyles.bodyMedium2,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Text.rich(
                        TextSpan(
                          text: R.strings.locationLabel,
                          style: AppTextStyles.bodySmall2,
                          children: [
                            TextSpan(
                              text: character.location.name,
                              style: AppTextStyles.bodySmall1.copyWith(color: AppColors.green400),
                            ),
                            TextSpan(text: '\n${R.strings.statusLabel}'),
                            TextSpan(
                              text: character.status.description,
                              style: AppTextStyles.bodySmall1.copyWith(color: AppColors.green400),
                            ),
                            TextSpan(text: '\n${R.strings.speciesLabel}'),
                            TextSpan(
                              text: character.species,
                              style: AppTextStyles.bodySmall1.copyWith(color: AppColors.green400),
                            ),
                            TextSpan(text: '\n${R.strings.genderLabel}'),
                            TextSpan(
                              text: character.gender.description,
                              style: AppTextStyles.bodySmall1.copyWith(color: AppColors.green400),
                            ),
                            TextSpan(text: '\n${R.strings.originLabel}'),
                            TextSpan(
                              text: character.origin.name,
                              style: AppTextStyles.bodySmall1.copyWith(color: AppColors.green400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.neutral400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      R.strings.episodesList,
                      style: AppTextStyles.bodyMedium2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: episodeList
                            .map<Widget>(
                              (episode) => Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      episode.name,
                                      style: AppTextStyles.bodySmall2.copyWith(
                                        color: AppColors.green400,
                                      ),
                                    ),
                                    Text(
                                      episode.episode,
                                      style: AppTextStyles.bodySmall2,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

extension CharacterStatusExt on CharacterStatus {
  String get description {
    switch (this) {
      case CharacterStatus.alive:
        return 'Vivo';
      case CharacterStatus.dead:
        return 'Morto';
      case CharacterStatus.unknown:
        return 'Desconhecido';
    }
  }
}

extension CharacterGenderExt on CharacterGender {
  String get description {
    switch (this) {
      case CharacterGender.male:
        return 'Masculino';
      case CharacterGender.female:
        return 'Feminino';
      case CharacterGender.genderless:
        return 'Sem gênero';
      case CharacterGender.unknown:
        return 'Desconhecido';
    }
  }
}
