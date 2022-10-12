import 'package:domain/src/services/analytics_service.dart';
import 'package:domain/src/use_cases/base/in_use_case.dart';

class LogButtonUseCase implements InUseCase<String> {
  final AnalyticsService analyticsService;

  const LogButtonUseCase(this.analyticsService);

  @override
  void call(String event) async => await analyticsService.logEvent(event);
}
