import 'dart:io';
import 'package:domain/src/use_cases/base/out_use_case.dart';
import 'package:url_launcher/url_launcher.dart';

const _urlAndroid =
    'https://play.google.com/store/apps/details?id=org.telegram.messenger&hl=en&gl=US';
const _urlMacOs = 'https://apps.apple.com/by/app/telegram/id747648890?mt=12';
const _urlIos = 'https://apps.apple.com/us/app/telegram-messenger/id686449807';

class UpdateAppUseCase implements OutUseCase<Future<void>> {
  @override
  Future<void> call() {
    final Uri _updateUrl = _createUri();
    return launchUrl(_updateUrl);
  }

  Uri _createUri() {
    if (Platform.isIOS) return Uri.parse(_urlIos);
    if (Platform.isMacOS) return Uri.parse(_urlMacOs);
    return Uri.parse(_urlAndroid);
  }
}
