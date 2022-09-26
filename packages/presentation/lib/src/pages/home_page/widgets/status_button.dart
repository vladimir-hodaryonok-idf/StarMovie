import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

const nowShowingTitle = 'Trending';
const comingSoonTitle = 'Anticipated';

class StatusButton extends StatelessWidget {
  const StatusButton({
    required this.activeButtonId,
    required this.id,
    required this.bloc,
    Key? key,
  });
  static const padding = 24;
  final MovieButtonStatus activeButtonId;
  final MovieButtonStatus id;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.width / 2 - padding;
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
              title,
              style: sfProSemiBold14px,
            ),
          ],
        ),
      ),
    );
  }

  String get title =>
      id == MovieButtonStatus.trending ? nowShowingTitle : comingSoonTitle;

  bool get isActive => activeButtonId == id;

  Decoration? decoration(BuildContext context) {
    return isActive
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.secondary,
          )
        : null;
  }

  Widget get playIcon => isActive && id != MovieButtonStatus.anticipated
      ? SvgPicture.asset(AssetsImages.playIcon)
      : SizedBox.shrink();
}
