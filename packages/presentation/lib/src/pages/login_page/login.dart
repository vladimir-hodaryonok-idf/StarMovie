import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/base_bloc/base_tile.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/login_page/widgets/form_widget.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/src/pages/login_page/bloc/login_data.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const _routeName = '/LoginPage';

  static page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const Login(),
        isShowNavBar: true,
      );

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends BlocScreenState<Login, LoginBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).loginTitle,
          style: sfProSemiBold24px,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: Dimens.size0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(Dimens.size1),
          child: Container(
            color: Theme.of(context).colorScheme.onPrimary,
            height: Dimens.size1,
          ),
        ),
      ),
      body: StreamBuilder<BaseTile<LoginData>>(
        stream: bloc.dataStream,
        builder: (context, snapShot) {
          final data = snapShot.data;
          final tile = data?.tile;
          if (data != null && tile != null) {
            return FormWidget(
              passwordValidation: bloc.validatePassword,
              loginValidation: bloc.validateLogin,
              onLoginChange: bloc.onLoginChange,
              onPasswordChange: bloc.onPasswordChange,
              formKey: bloc.formKey,
              onLoginTap: bloc.auth,
              onFacebookTap: bloc.authFacebook,
              onGoogleTap: bloc.authGoogle,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
