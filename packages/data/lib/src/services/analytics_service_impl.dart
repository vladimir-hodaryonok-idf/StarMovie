import 'package:domain/domain.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsServiceImpl implements AnalyticsService {
  final FirebaseAnalytics firebaseAnalytics;

  const AnalyticsServiceImpl(this.firebaseAnalytics);

  @override
  Future<void> logEvent(String event) =>
      firebaseAnalytics.logEvent(name: event);
}
