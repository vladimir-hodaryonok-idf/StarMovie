import 'package:flutter/material.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/details_button.dart';

class MovieDetailsSwitcher extends StatelessWidget {
  const MovieDetailsSwitcher({
    Key? key,
    required this.currentPosition,
  }) : super(key: key);
  final DetailsSwitcher currentPosition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
              child: DetailsButton(
                id: DetailsSwitcher.detail,
                activeButtonId: currentPosition,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: DetailsButton(
                id: DetailsSwitcher.reviews,
                activeButtonId: currentPosition,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: DetailsButton(
                id: DetailsSwitcher.showtime,
                activeButtonId: currentPosition,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
