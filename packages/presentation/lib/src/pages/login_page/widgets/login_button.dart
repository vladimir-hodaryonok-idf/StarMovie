import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';

class LoginButton extends StatelessWidget {
  final LoginBloc bloc;
  final bool isLoading;

  const LoginButton({
    required this.bloc,
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimens.size48,
      child: ElevatedButton(
        onPressed: bloc.auth,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: isLoading == true
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
    );
  }
}
