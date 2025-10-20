import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

import '../../../domain/models/character_model.dart';
import '../../../main/di/di.dart';
import '../../../res/app_lotties.dart';
import '../../../res/theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../../../view_model/view_model.dart';
import '../../mixins/mixins.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class CharacterDetailsScreen extends StatefulWidget {
  const CharacterDetailsScreen({super.key, required this.characterId});

  final int characterId;

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> with UIErrorSnackbarMixin {
  late final CharacterDetailsViewModel viewModel = getIt<CharacterDetailsViewModel>();
  late final screenSize = MediaQuery.sizeOf(context);

  double get imageHeight => screenSize.width * 0.8;

  Future<void> loadCharacterDetails() async {
    await viewModel.loadCharacterDetails(widget.characterId);
  }

  @override
  void initState() {
    super.initState();
    handleMainError(context: context, mainErrorStream: viewModel.mainErrorStream);
    SchedulerBinding.instance.addPostFrameCallback((_) => viewModel.loadCharacterDetails(widget.characterId));
  }

  late final appBarSliver = SliverAppBar(
    pinned: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: (Navigator.canPop(context)
        ? const IconButton(
            iconSize: 40,
            icon: Icon(Icons.chevron_left_rounded),
            onPressed: NavigationUtils.back,
            splashRadius: 24,
            padding: EdgeInsets.zero,
            color: AppColors.neutral0,
          )
        : null),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      bottom: false,
      child: RefreshIndicator(
        backgroundColor: AppColors.neutral400,
        onRefresh: loadCharacterDetails,
        child: StreamBuilder<bool>(
          stream: viewModel.isLoadingStream,
          initialData: viewModel.isLoading,
          builder: (context, loadingSnapshot) => StreamBuilder<CharacterModel?>(
            stream: viewModel.characterDetailsStream,
            initialData: viewModel.characterDetails,
            builder: (context, characterDetailsSnapshot) {
              final List<Widget> slivers = [appBarSliver];
              if (loadingSnapshot.data ?? false) {
                slivers.add(
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: RickLoading(
                      height: 200,
                    ),
                  ),
                );
              } else if (characterDetailsSnapshot.hasData) {
                final CharacterModel character = characterDetailsSnapshot.data!;
                slivers.add(
                  CharacterDetailsHeader(imageHeight: imageHeight, character: character),
                );
                slivers.add(
                  CharacterDetailsBody(character: character, episodeList: viewModel.episodeList),
                );
              } else {
                slivers.add(
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        LottieBuilder.asset(
                          AppLotties.rickAwake,
                          height: screenSize.height * 0.4,
                          fit: BoxFit.fitHeight,
                        ),
                        OnErrorReloadButton(reloadFunction: loadCharacterDetails),
                      ],
                    ),
                  ),
                );
              }
              return CustomScrollView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                slivers: slivers,
              );
            },
          ),
        ),
      ),
    ),
  );
}
