import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/src/pages/login_page/widgets/movie_form_field.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';

enum TextFieldType { login, password }

class LoginForm extends StatelessWidget {
  final LoginBloc bloc;

  const LoginForm({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: bloc.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).loginUserName,
            style: sfProSemiMedium12px50opacity,
          ),
          const SizedBox(height: Dimens.size8),
          MovieFormField(
            bloc: bloc,
            type: TextFieldType.login,
          ),
          const SizedBox(height: Dimens.size20),
          Text(
            S.of(context).loginPassword,
            style: sfProSemiMedium12px50opacity,
          ),
          const SizedBox(height: Dimens.size8),
          MovieFormField(
            bloc: bloc,
            type: TextFieldType.password,
          ),
          const SizedBox(height: Dimens.size20),
        ],
      ),
    );
  }
}
