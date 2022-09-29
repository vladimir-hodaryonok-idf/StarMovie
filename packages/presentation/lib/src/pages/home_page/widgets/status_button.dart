import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/generated/l10n.dart';
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
    final containerWidth =
        MediaQuery.of(context).size.width.fiftyPercents - Dimens.size_24;
    return GestureDetector(
      onTap: () => bloc.onButtonTap(id),
      child: Container(
        height: double.infinity,
        width: containerWidth,
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
            borderRadius: BorderRadius.circular(Dimens.size_16),
            color: Theme.of(context).colorScheme.secondary,
          )
        : null;
  }

  Widget get playIcon => isActive && id != MovieButtonStatus.anticipated
      ? SvgPicture.asset(AssetsImages.playIcon)
      : const SizedBox.shrink();
}
