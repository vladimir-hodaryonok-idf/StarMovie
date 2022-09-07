import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

class StatusButton extends StatelessWidget {
  const StatusButton({
    Key? key,
    required this.isActive,
    required this.text,
  }) : super(key: key);
  static const padding = 24;
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width / 2 - padding,
      decoration: isActive
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.secondary,
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isActive ? SvgPicture.asset(Assets.playIcon) : SizedBox.shrink(),
          Text(
            text,
            style: sfProSemiBold14px,
          )
        ],
      ),
    );
  }
}
