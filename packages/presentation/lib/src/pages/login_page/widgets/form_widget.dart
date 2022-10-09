import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/base_bloc/base_tile.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/src/pages/login_page/widgets/error_message_widget.dart';
import 'package:presentation/style/colors.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

class FormWidget extends StatelessWidget {
  final LoginBloc bloc;
  final String? tile;
  final BaseTile? data;

  const FormWidget({
    required this.bloc,
    required this.tile,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ErrorMessageWidget(
              bloc: bloc,
              tile: tile ?? '',
            ),
            Text(
              S.of(context).loginUserName,
              style: sfProSemiMedium12px50opacity,
            ),
            const SizedBox(height: Dimens.size8),
            TextField(
              onChanged: bloc.onLoginChange,
              cursorColor: Colors.white,
              style: const TextStyle(color: MyColors.colorTitle),
              decoration: InputDecoration(
                prefixIcon: SvgPicture.asset(
                  AssetsImages.profile,
                  width: Dimens.size18,
                  height: Dimens.size18,
                  fit: BoxFit.none,
                ),
                filled: true,
                fillColor: MyColors.colorTextField,
              ),
            ),
            const SizedBox(height: Dimens.size20),
            Text(
              S.of(context).loginPassword,
              style: sfProSemiMedium12px50opacity,
            ),
            const SizedBox(height: Dimens.size8),
            TextField(
              onChanged: bloc.onPasswordChange,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              cursorColor: Colors.white,
              style: const TextStyle(
                color: MyColors.colorTitle,
              ),
              decoration: InputDecoration(
                prefixIcon: SvgPicture.asset(
                  AssetsImages.lock,
                  width: Dimens.size18,
                  height: Dimens.size18,
                  fit: BoxFit.none,
                ),
                filled: true,
                fillColor: MyColors.colorTextField,
              ),
            ),
            const SizedBox(height: Dimens.size20),
            SizedBox(
              width: double.infinity,
              height: Dimens.size48,
              child: ElevatedButton(
                onPressed: bloc.auth,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                child: data?.isLoading == true
                    ? const SizedBox(
                        width: Dimens.size20,
                        height: Dimens.size20,
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        S.of(context).loginBtn,
                        style: sfProSemiBold16px,
                      ),
              ),
            ),
            const SizedBox(height: Dimens.size50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimens.size44,
                  height: Dimens.size44,
                  child: ElevatedButton(
                    onPressed: bloc.authFacebook,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyColors.colorFaceBook,
                      ),
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
                ),
                const SizedBox(width: Dimens.size24),
                SizedBox(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
