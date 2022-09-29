import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_showing_status.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({
    required this.tile,
    required this.bloc,
    super.key,
  });

  final HomePageData? tile;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieShowingStatus(
          buttonStatus: tile?.buttonStatus ?? MovieButtonStatus.trending,
          bloc: bloc,
        ),
        Center(
            child: LinearProgressIndicator(
          color: Theme.of(context).colorScheme.secondary,
        )),
      ],
    );
  }
}
