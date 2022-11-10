import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/pages/home_page/adapt_home_widgets.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

class StatusButton extends StatelessWidget {
  const StatusButton({
    required this.activeButtonId,
    required this.id,
    required this.bloc,
    super.key,
  });

  final MovieButtonStatus activeButtonId;
  final MovieButtonStatus id;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bloc.onButtonTap(id),
      child: Container(
        height: double.infinity,
        width: AdaptHomeWidgets.statusButtonWidth(context),
        decoration: decoration(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            playIcon,
            Text(
              id == MovieButtonStatus.trending
                  ? S.of(context).nowShowingTitle
                  : S.of(context).comingSoonTitle,
              style: sfProSemiBold14px,
            ),
          ],
        ),
      ),
    );
  }

  bool get isActive => activeButtonId == id;

  Decoration? decoration(BuildContext context) {
    return isActive
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.size16),
            color: Theme.of(context).colorScheme.secondary,
          )
        : null;
  }

  Widget get playIcon => isActive && id != MovieButtonStatus.anticipated
      ? SvgPicture.asset(AssetsImages.playIcon)
      : const SizedBox.shrink();
}
