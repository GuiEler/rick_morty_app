import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/models/models.dart';
import '../../../main/di/di.dart';
import '../../../res/theme/app_colors.dart';
import '../../../res/theme/app_text_styles.dart';
import '../../../view_model/view_model.dart';
import '../../helpers/helpers.dart';
import '../../mixins/mixins.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> with UIErrorSnackbarMixin {
  late final CharactersViewModel viewmodel = getIt<CharactersViewModel>();

  @override
  void initState() {
    super.initState();
    handleMainError(context: context, mainErrorStream: viewmodel.mainErrorStream);
  }

  @override
  void dispose() {
    viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: RefreshIndicator(
        backgroundColor: AppColors.neutral400,
        onRefresh: () async => viewmodel.pagingController.refresh(),
        child: PagingListener(
          controller: viewmodel.pagingController,
          builder: (context, state, fetchNextPage) => CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text(R.strings.appTitle),
                titleTextStyle: AppTextStyles.headlineMedium,
                backgroundColor: AppColors.neutral600,
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                sliver: SliverList.list(
                  children: [
                    Text(
                      R.strings.charactersTitle,
                      style: AppTextStyles.bodyMedium2,
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                sliver: PagedSliverGrid<int, CharacterModel>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate(
                    noMoreItemsIndicatorBuilder: (context) => const NoMoreCharacters(),
                    itemBuilder: (context, item, index) => CharacterItem(
                      key: ValueKey(item.id),
                      item: item,
                      onTap: () => viewmodel.goToDetails(item.id),
                    ),
                    newPageProgressIndicatorBuilder: (context) => const RickLoading(),
                    firstPageProgressIndicatorBuilder: (context) => const RickLoading(),
                    firstPageErrorIndicatorBuilder: (context) => OnErrorReloadButton(
                      reloadFunction: () => viewmodel.pagingController.refresh(),
                    ),
                    newPageErrorIndicatorBuilder: (context) =>
                        OnErrorReloadButton(reloadFunction: viewmodel.pagingController.fetchNextPage),
                    noItemsFoundIndicatorBuilder: (context) => const CharactersEmpty(),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
