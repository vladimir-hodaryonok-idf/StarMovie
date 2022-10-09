import 'package:domain/src/services/analytics_service.dart';
import 'package:domain/src/use_cases/base/in_out_use_case.dart';

class LogEventUseCase implements InOutUseCase<String,void>{
  final FirebaseAnalyticsService analyticsService;
  const LogEventUseCase(this.analyticsService);
  @override
  void call(String event) => analyticsService.logEvent(event);

}