import 'package:flutter/material.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/details_button.dart';
import 'package:presentation/style/dimens.dart';

class MovieDetailsSwitcher extends StatelessWidget {
  const MovieDetailsSwitcher({
    required this.onTap,
    required this.currentPosition,
    super.key,
  });

  final Function(DetailsSwitcher) onTap;
  final DetailsSwitcher currentPosition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.size18),
      child: Container(
        height: Dimens.size36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.size20),
          border: Border.all(
            width: Dimens.size1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.size4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailsButton(
                id: DetailsSwitcher.detail,
                activeButtonId: currentPosition,
                onTap: onTap,
              ),
              DetailsButton(
                id: DetailsSwitcher.reviews,
                activeButtonId: currentPosition,
                onTap: onTap,
              ),
              DetailsButton(
                id: DetailsSwitcher.showtime,
                activeButtonId: currentPosition,
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
