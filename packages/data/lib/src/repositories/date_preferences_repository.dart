import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _trendingUpdateDateKey = 'trendingUpdateDate';
const _anticipatedUpdateDateKey = 'anticipatedUpdateDate';

class DatePreferencesRepositoryImpl implements DatePreferencesRepository {
  final SharedPreferences sharedPreferences;

  const DatePreferencesRepositoryImpl({required this.sharedPreferences});

  @override
  DateTime? getAnticipatedLastUpdateDate() {
    final date = sharedPreferences.getString(_anticipatedUpdateDateKey);
    if (date != null) {
      return DateTime.parse(date);
    }
    return null;
  }

  @override
  DateTime? getTrendingLastRequestDate() {
    final date = sharedPreferences.getString(_trendingUpdateDateKey);
    if (date != null) {
      return DateTime.parse(date);
    }
    return null;
  }

  @override
  Future<void> saveAnticipatedLastUpdateFromApiDate(DateTime date) async {
    await sharedPreferences.setString(
      _anticipatedUpdateDateKey,
      date.toString(),
    );
  }

  @override
  Future<void> saveTrendingLastUpdateFromApiDate(DateTime date) async {
    await sharedPreferences.setString(
      _trendingUpdateDateKey,
      date.toString(),
    );
  }
}
