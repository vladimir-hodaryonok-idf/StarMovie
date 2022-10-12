abstract class AnalyticsService {
  Future<void> logEvent(String event, {Map<String, Object?>? payload});
}
