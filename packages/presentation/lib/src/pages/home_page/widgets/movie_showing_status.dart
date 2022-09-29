import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/src/pages/home_page/widgets/status_button.dart';
import 'package:presentation/style/dimens.dart';

class MovieShowingStatus extends StatelessWidget {
  final MovieButtonStatus buttonStatus;
  final HomeBloc bloc;

  const MovieShowingStatus({
    required this.buttonStatus,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimens.size_18),
      height: Dimens.size_40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.size_20),
        border: Border.all(
          width: Dimens.size_1,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.size_4),
        child: Row(
          children: [
            StatusButton(
              id: MovieButtonStatus.trending,
              activeButtonId: buttonStatus,
              bloc: bloc,
            ),
            StatusButton(
              id: MovieButtonStatus.anticipated,
              activeButtonId: buttonStatus,
              bloc: bloc,
            ),
          ],
        ),
      ),
    );
  }
}
