import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/base_bloc/base_tile.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/base_bloc/movie_args.dart';
import 'package:presentation/src/navigation/base_page.dart';

import 'bloc/movie_details_bloc.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key}) : super(key: key);
  static const _routeName = '/MovieDetails';

  static page(MovieArgs args) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        showSlideAnim: true,
        builder: (context) => const MovieDetails(),
        arguments: args,
        isShowNavBar: true,
      );

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState
    extends BlocScreenState<MovieDetails, MovieDetailsBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<BaseTile<Movie?>>(
        stream: bloc.dataStream,
        builder: (_, snapshot) {
          final tile = snapshot.data?.tile;
          if (!snapshot.hasData || tile == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          return SingleChildScrollView(
            child: Center(
              child: Text('Details screen soon in prod =)'),
            ),
          );
        },
      ),
    );
  }
}
