import 'package:flutter/material.dart';
import 'package:presentation/src/pages/login_page/widgets/movie_form_field.dart';
import 'package:presentation/style/dimens.dart';

class LoginForm extends StatelessWidget {
  final Function loginValidation;
  final Function passwordValidation;
  final Function(String) onLoginChange;
  final Function(String) onPasswordChange;
  final GlobalKey<FormState> formKey;

  const LoginForm({
    required this.passwordValidation,
    required this.loginValidation,
    required this.onLoginChange,
    required this.onPasswordChange,
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimens.size8),
            MovieFormField(
              isPasswordField: false,
              onChange: onLoginChange,
              validation: loginValidation,
            ),
            const SizedBox(height: Dimens.size20),
            MovieFormField(
              isPasswordField: true,
              onChange: onPasswordChange,
              validation: passwordValidation,
            ),
            const SizedBox(height: Dimens.size20),
          ],
        ),
      ),
    );
  }
}
