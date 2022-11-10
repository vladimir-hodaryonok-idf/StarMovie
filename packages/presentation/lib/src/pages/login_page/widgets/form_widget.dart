import 'package:flutter/material.dart';
import 'package:presentation/src/pages/login_page/widgets/facebook_login_button.dart';
import 'package:presentation/src/pages/login_page/widgets/google_login_button.dart';
import 'package:presentation/src/pages/login_page/widgets/login_button.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/src/pages/login_page/widgets/login_form.dart';

class FormWidget extends StatelessWidget {
  final Function loginValidation;
  final Function passwordValidation;
  final Function(String) onLoginChange;
  final Function(String) onPasswordChange;
  final GlobalKey<FormState> formKey;
  final Function() onLoginTap;
  final Function() onFacebookTap;
  final Function() onGoogleTap;

  const FormWidget({
    required this.passwordValidation,
    required this.loginValidation,
    required this.onLoginChange,
    required this.onPasswordChange,
    required this.formKey,
    required this.onLoginTap,
    required this.onFacebookTap,
    required this.onGoogleTap,
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
            LoginForm(
              passwordValidation: passwordValidation,
              loginValidation: loginValidation,
              onLoginChange: onLoginChange,
              onPasswordChange: onPasswordChange,
              formKey: formKey,
            ),
            LoginButton(onTap: onLoginTap),
            const SizedBox(height: Dimens.size50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FacebookLoginButton(onTap: onFacebookTap),
                const SizedBox(width: Dimens.size24),
                GoogleLoginButton(onTap: onGoogleTap),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
