import 'package:domain/domain.dart';

import 'base/in_use_case.dart';

class LogPageUseCase implements InUseCase<String> {
  final AnalyticsService analyticsService;

  const LogPageUseCase(this.analyticsService);

  @override
  void call(String pageName) async {
    const pageKey = 'page';
    const pageEvent = 'page_navigation';
    await analyticsService.logEvent(
      pageEvent,
      payload: {pageKey: pageName},
    );
  }
}
