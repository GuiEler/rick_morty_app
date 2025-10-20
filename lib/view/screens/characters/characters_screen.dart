import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/models/models.dart';
import '../../../main/di/di.dart';
import '../../../res/theme/app_colors.dart';
import '../../../res/theme/app_text_styles.dart';
import '../../../view_model/view_model.dart';
import '../../helpers/helpers.dart';
import '../../mixins/mixins.dart';
import '../../widgets/on_error_reload_button.dart';
import 'widgets/widgets.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> with UIErrorManager {
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
                    itemBuilder: (context, item, index) => Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned.fill(
                          child: Container(
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
                    ),
                    newPageProgressIndicatorBuilder: (context) => const CharactersLoading(),
                    firstPageProgressIndicatorBuilder: (context) => const CharactersLoading(),
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
