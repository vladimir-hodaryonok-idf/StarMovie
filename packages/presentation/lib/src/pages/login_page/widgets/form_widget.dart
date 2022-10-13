import 'package:flutter/material.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/src/pages/login_page/bloc/login_data.dart';
import 'package:presentation/src/pages/login_page/widgets/error_message_widget.dart';
import 'package:presentation/src/pages/login_page/widgets/facebook_login_button.dart';
import 'package:presentation/src/pages/login_page/widgets/google_login_button.dart';
import 'package:presentation/src/pages/login_page/widgets/login_button.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/src/pages/login_page/widgets/login_form.dart';

class FormWidget extends StatelessWidget {
  final LoginBloc bloc;
  final LoginData tile;
  final bool isLoading;

  const FormWidget({
    required this.bloc,
    required this.tile,
    required this.isLoading,
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
            ErrorMessageWidget(message: tile.errorMessage),
            LoginForm(bloc: bloc),
            LoginButton(
              bloc: bloc,
              isLoading: isLoading,
            ),
            const SizedBox(height: Dimens.size50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FacebookLoginButton(bloc: bloc),
                const SizedBox(width: Dimens.size24),
                GoogleLoginButton(bloc: bloc),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
