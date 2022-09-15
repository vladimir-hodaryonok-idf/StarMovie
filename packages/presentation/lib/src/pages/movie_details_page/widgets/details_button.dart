import 'package:flutter/material.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/style/text_styles/styles.dart';

class DetailsButton extends StatelessWidget {
  const DetailsButton({
    Key? key,
    required this.activeButtonId,
    required this.id,
  }) : super(key: key);
  static const padding = 24;
  final DetailsSwitcher id;
  final DetailsSwitcher activeButtonId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width / 3 - padding,
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

  Decoration? decoration(BuildContext context) {
    return isActive
        ? BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Theme.of(context).colorScheme.secondary,
    )
        : null;
  }

  bool get isActive => activeButtonId == id;
}