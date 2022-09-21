import 'package:flutter/material.dart';
import 'package:presentation/src/base_bloc/base_tile.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_showing_status.dart';
import 'package:presentation/style/text_styles/styles.dart';

class HomeError extends StatelessWidget {
  const HomeError({
    Key? key,
    required this.tile,
    required this.bloc,
    required this.state,
  }) : super(key: key);

  final HomePageData tile;
  final HomeBloc bloc;
  final BaseTile<HomePageData> state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MovieShowingStatus(
            buttonStatus: tile.buttonStatus,
            bloc: bloc,
          ),
          Spacer(),
          Text(
            state.exception?.details ?? 'Unknown Error',
            style: sfProSemiBold14px,
          ),
          IconButton(
            onPressed: () => bloc.refreshList(isLoading: true),
            icon: Icon(Icons.refresh),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
