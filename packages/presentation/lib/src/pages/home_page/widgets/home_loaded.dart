import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_grid_item.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_showing_status.dart';
import 'package:presentation/src/pages/home_page/widgets/shadow_movie_item.dart';

const shadowListLength = 10;

class HomeBody extends StatelessWidget {
  const HomeBody({
    required this.tile,
    required this.bloc,
    required this.isLoading,
    Key? key,
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
              left: 18.0,
              right: 18.0,
            ),
            child: RefreshIndicator(
              color: Theme.of(context).colorScheme.secondary,
              onRefresh: bloc.refreshList,
              child: GridView.builder(
                key: tile.buttonStatus == MovieButtonStatus.trending
                    ? PageStorageKey('trends')
                    : PageStorageKey('anticipated'),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1 / 2.2,
                ),
                itemCount:
                    isLoading ? shadowListLength : tile.moviesList.length,
                itemBuilder: (context, index) {
                  return isLoading
                      ? ShadowItem()
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
