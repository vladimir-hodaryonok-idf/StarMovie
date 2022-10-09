import 'package:domain/domain.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsServiceImpl implements FirebaseAnalyticsService {
  final FirebaseAnalytics firebaseAnalytics;

  const FirebaseAnalyticsServiceImpl(this.firebaseAnalytics);

  @override
  Future<void> logEvent(String event) =>
      firebaseAnalytics.logEvent(name: event);
}
