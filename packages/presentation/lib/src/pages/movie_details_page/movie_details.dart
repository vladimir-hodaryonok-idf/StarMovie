import 'package:flutter/material.dart';
import 'package:presentation/src/base_bloc/base_tile.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/base_bloc/movie_args.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/cast_and_crew.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/custom_appbar.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/expandable_description.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/movie_cover.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/movie_details_switcher.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/movie_info.dart';
import 'bloc/details_data.dart';
import 'bloc/movie_details_bloc.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);
  static const _routeName = '/MovieDetails';

  static page(MovieArgs args) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        showSlideAnim: true,
        builder: (context) => const MovieDetailsPage(),
        arguments: args,
      );

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState
    extends BlocScreenState<MovieDetailsPage, MovieDetailsBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<BaseTile<DetailsData>>(
        stream: bloc.dataStream,
        builder: (_, snapshot) {
          final tile = snapshot.data?.tile;
          final details = tile?.movieDetails;
          if (details == null || tile == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          return SingleChildScrollView(
            child: Center(
              child: Stack(
                children: [
                  Column(
                    children: [
                      MovieCover(
                        imageUrl: details.image,
                      ),
                      MovieInfo(details: details),
                      MovieDetailsSwitcher(
                        currentPosition: tile.detailsSwitcher,
                      ),
                      ExpandableDescription(
                        description: details.overview,
                      ),
                      CastAndCrewList(
                        castList: [],
                      )
                    ],
                  ),
                  SafeArea(
                    child: CustomAppBar(
                      bloc: bloc,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
