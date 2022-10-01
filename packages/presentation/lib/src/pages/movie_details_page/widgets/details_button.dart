import 'package:flutter/material.dart';
import 'package:presentation/const/app.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/style/dimens.dart';

class DetailsButton extends StatelessWidget {
  const DetailsButton({
    required this.activeButtonId,
    required this.id,
    super.key,
  });

  final DetailsSwitcher id;
  final DetailsSwitcher activeButtonId;

  Decoration? decoration(BuildContext context) {
    return isActive
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.size16),
            color: Theme.of(context).colorScheme.secondary,
          )
        : null;
  }

  bool get isActive => activeButtonId == id;

  String buttonName(DetailsSwitcher id) {
    switch (id) {
      case DetailsSwitcher.detail:
        return S.current.detailBtn;
      case DetailsSwitcher.reviews:
        return S.current.reviewsBtn;
      case DetailsSwitcher.showtime:
        return S.current.showTimeBtn;
    }
  }

  @override
  Widget build(BuildContext context) {
    final details_button_w =
        MediaQuery.of(context).size.width / AppConst.buttonsCount -
            Dimens.size24;
    return GestureDetector(
      onTap: () {
        //todo implement
      },
      child: Container(
        height: double.infinity,
        width: details_button_w,
        decoration: decoration(context),
        child: Center(
          child: Text(
            buttonName(id),
            textAlign: TextAlign.center,
            style: sfProSemiBold14px,
          ),
        ),
      ),
    );
  }
}
