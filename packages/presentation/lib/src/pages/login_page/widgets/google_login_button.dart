import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/style/colors.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/utils/images_container.dart';

class GoogleLoginButton extends StatelessWidget {
  final LoginBloc bloc;

  const GoogleLoginButton({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.size44,
      height: Dimens.size44,
      child: ElevatedButton(
        onPressed: bloc.authGoogle,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyColors.colorGoogle,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Dimens.size44,
              ),
            ),
          ),
        ),
        child: SvgPicture.asset(
          AssetsImages.google,
          width: Dimens.size18,
          height: Dimens.size18,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
