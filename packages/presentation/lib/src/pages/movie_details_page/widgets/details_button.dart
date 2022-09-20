import 'package:flutter/material.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/style/dimens.dart' as D;

class DetailsButton extends StatelessWidget {
  const DetailsButton({
    Key? key,
    required this.activeButtonId,
    required this.id,
  }) : super(key: key);
  final DetailsSwitcher id;
  final DetailsSwitcher activeButtonId;

  Decoration? decoration(BuildContext context) {
    return isActive
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(D.border_r_16),
            color: Theme.of(context).colorScheme.secondary,
          )
        : null;
  }

  bool get isActive => activeButtonId == id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: double.infinity,
        width: D.details_button_w(context),
        decoration: decoration(context),
        child: Center(
          child: Text(
            id.toString(),
            textAlign: TextAlign.center,
            style: sfProSemiBold14px,
          ),
        ),
      ),
    );
  }
}
