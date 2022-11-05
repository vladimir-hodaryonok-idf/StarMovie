import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/splash_screen/bloc/alert_dialog_data.dart';
import 'package:presentation/src/pages/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:presentation/style/colors.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const _routeName = '/SplashScreen';

  static page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const SplashScreen(),
        isShowNavBar: false,
      );

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState
    extends BlocScreenState<SplashScreen, SplashScreenBloc> {
  @override
  void initState() {
    super.initState();
    bloc.dataStream.listen(
      (alertData) {
        if (alertData.tile != null) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return _showAlertDialog(data: alertData.tile!);
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(MyColors.splashScreenUp),
              Color(MyColors.splashScreenBottom),
            ],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(AssetsImages.splashAsset),
        ),
      ),
    );
  }

  AlertDialog _showAlertDialog({
    required AlertDialogData data,
  }) {
    return AlertDialog(
      title: Text(
        data.title,
        style: sfProSemiBold16px,
      ),
      content: Text(
        data.content,
        style: sfProSemiRegular14px,
      ),
      actions: [
        generateUpdateBtn(data),
        generateContinueBtn(data),
      ],
    );
  }

  Widget generateContinueBtn(AlertDialogData data) {
    return data.useCurrentCallBack != null
        ? TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
              data.useCurrentCallBack?.call();
            },
            child: Text(
              S.of(context).continueWithOld,
              style: sfProSemiRegular14px,
            ),
          )
        : SizedBox.shrink();
  }

  Widget generateUpdateBtn(AlertDialogData data) {
    return data.updateCallBack != null
        ? TextButton(
            onPressed: data.updateCallBack,
            child: Text(
              S.of(context).update,
              style: sfProSemiRegular14px,
            ),
          )
        : SizedBox.shrink();
  }
}
