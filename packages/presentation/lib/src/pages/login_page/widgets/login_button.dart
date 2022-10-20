import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';

class LoginButton extends StatelessWidget {
  final Function() onTap;

  const LoginButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimens.size48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: Text(
          S.of(context).loginBtn,
          style: sfProSemiBold16px,
        ),
      ),
    );
  }
}
