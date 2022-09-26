import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/src/pages/home_page/widgets/status_button.dart';

class MovieShowingStatus extends StatelessWidget {
  final MovieButtonStatus buttonStatus;
  final HomeBloc bloc;

  const MovieShowingStatus({
    required this.buttonStatus,
    required this.bloc,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
              child: StatusButton(
                id: MovieButtonStatus.trending,
                activeButtonId: buttonStatus,
                bloc: bloc,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: StatusButton(
                id: MovieButtonStatus.anticipated,
                activeButtonId: buttonStatus,
                bloc: bloc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
