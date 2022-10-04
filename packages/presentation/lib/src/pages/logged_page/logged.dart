import 'package:flutter/material.dart';
import 'package:presentation/src/navigation/base_page.dart';

class LoggedPage extends StatelessWidget {
  const LoggedPage({Key? key}) : super(key: key);

  static const _routeName = '/LoggedPage';

  static page() => BasePage(
    key: const ValueKey(_routeName),
    name: _routeName,
    builder: (context) => const LoggedPage(),
    isShowNavBar: true,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Successfully logged in'),
    );
  }
}
