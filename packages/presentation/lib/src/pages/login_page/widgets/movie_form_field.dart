import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/src/pages/login_page/widgets/login_form.dart';
import 'package:presentation/style/colors.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/utils/images_container.dart';

class MovieFormField extends StatelessWidget {
  final LoginBloc bloc;
  final TextFieldType type;

  const MovieFormField({
    required this.bloc,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: type == TextFieldType.login ? false : true,
      validator: (_) => type == TextFieldType.login
          ? bloc.tile.loginValidation
          : bloc.tile.passwordValidation,
      textInputAction: type == TextFieldType.login
          ? TextInputAction.next
          : TextInputAction.done,
      onChanged: type == TextFieldType.login
          ? bloc.onLoginChange
          : bloc.onPasswordChange,
      cursorColor: Colors.white,
      style: const TextStyle(color: MyColors.colorTitle),
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(
          type == TextFieldType.login
              ? AssetsImages.profile
              : AssetsImages.lock,
          width: Dimens.size18,
          height: Dimens.size18,
          fit: BoxFit.none,
        ),
        filled: true,
        fillColor: MyColors.colorTextField,
      ),
    );
  }
}
