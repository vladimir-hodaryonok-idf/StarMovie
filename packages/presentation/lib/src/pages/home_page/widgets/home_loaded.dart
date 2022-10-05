import 'package:flutter/material.dart';
import 'package:presentation/const/app.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_grid_item.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_showing_status.dart';
import 'package:presentation/src/pages/home_page/widgets/shadow_movie_item.dart';
import 'package:presentation/style/dimens.dart';

import 'empty_lists_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    required this.tile,
    required this.bloc,
    required this.isLoading,
    super.key,
  });

  final HomePageData tile;
  final HomeBloc bloc;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieShowingStatus(
          buttonStatus: tile.buttonStatus,
          bloc: bloc,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Dimens.size18,
              right: Dimens.size18,
            ),
            child: RefreshIndicator(
              color: Theme.of(context).colorScheme.secondary,
              onRefresh: bloc.refreshList,
              child: (tile.anticipated.isEmpty &&
                      tile.trending.isEmpty &&
                      !isLoading)
                  ? EmptyListsState(bloc: bloc)
                  : GridView.builder(
                      key: tile.buttonStatus == MovieButtonStatus.trending
                          ? PageStorageKey(AppConst.trendsListKey)
                          : PageStorageKey(AppConst.anticipatedListKey),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: AppConst.movieListCrossAxisCount,
                        crossAxisSpacing: Dimens.size8,
                        mainAxisSpacing: Dimens.size8,
                        childAspectRatio: Dimens.aspectRatio1to22,
                      ),
                      itemCount: isLoading
                          ? AppConst.shadowMovieListLength
                          : tile.moviesList.length,
                      itemBuilder: (context, index) {
                        return isLoading
                            ? const ShadowItem()
                            : MovieGridItem(
                                movie: tile.moviesList[index],
                                bloc: bloc,
                                index: index,
                              );
                      },
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
