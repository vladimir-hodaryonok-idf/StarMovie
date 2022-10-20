import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/style/colors.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/utils/images_container.dart';

class FacebookLoginButton extends StatelessWidget {
  final Function() onTap;

  const FacebookLoginButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.size44,
      height: Dimens.size44,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColors.colorFaceBook),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.size44),
            ),
          ),
        ),
        child: SvgPicture.asset(
          AssetsImages.facebook,
          width: Dimens.size18,
          height: Dimens.size18,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
