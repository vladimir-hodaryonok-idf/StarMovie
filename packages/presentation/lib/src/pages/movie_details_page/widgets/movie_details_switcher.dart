import 'package:flutter/material.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/details_button.dart';
import 'package:presentation/style/dimens.dart';

class MovieDetailsSwitcher extends StatelessWidget {
  const MovieDetailsSwitcher({
    required this.currentPosition,
    Key? key,
  });
  final DetailsSwitcher currentPosition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding_18),
      child: Container(
        height: Dimens.height_36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.padding_20),
          border: Border.all(
            width: Dimens.width_1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.padding_4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailsButton(
                id: DetailsSwitcher.detail,
                activeButtonId: currentPosition,
              ),
              DetailsButton(
                id: DetailsSwitcher.reviews,
                activeButtonId: currentPosition,
              ),
              DetailsButton(
                id: DetailsSwitcher.showtime,
                activeButtonId: currentPosition,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
