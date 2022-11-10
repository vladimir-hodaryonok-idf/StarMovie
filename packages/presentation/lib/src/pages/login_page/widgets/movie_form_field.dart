import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/style/colors.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/utils/images_container.dart';

class MovieFormField extends StatelessWidget {
  final Function validation;
  final Function(String) onChange;
  final bool isPasswordField;

  const MovieFormField({
    required this.validation,
    required this.onChange,
    required this.isPasswordField,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordField,
      validator: (_) => validation(),
      textInputAction:
          isPasswordField ? TextInputAction.done : TextInputAction.next,
      onChanged: onChange,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Color(MyColors.colorTitle),
      ),
      decoration: InputDecoration(
        hintText: isPasswordField
            ? S.of(context).loginPassword
            : S.of(context).loginUserName,
        prefixIcon: SvgPicture.asset(
          isPasswordField ? AssetsImages.lock : AssetsImages.profile,
          width: Dimens.size18,
          height: Dimens.size18,
          fit: BoxFit.none,
        ),
        filled: true,
        fillColor: Color(MyColors.colorTextField),
      ),
    );
  }
}
