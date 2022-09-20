import 'package:flutter/material.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/details_button.dart';
import 'package:presentation/style/dimens.dart' as D;

class MovieDetailsSwitcher extends StatelessWidget {
  const MovieDetailsSwitcher({
    Key? key,
    required this.currentPosition,
  }) : super(key: key);
  final DetailsSwitcher currentPosition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(D.padding_18),
      child: Container(
        height: D.movieDetailsSW_h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.padding_20),
          border: Border.all(
            width: D.border_w_1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(D.padding_4),
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
