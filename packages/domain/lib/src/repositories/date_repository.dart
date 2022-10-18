abstract class DatePreferencesRepository{
  Future<void> saveTrendingLastUpdateFromApiDate(DateTime date);
  Future<void> saveAnticipatedLastUpdateFromApiDate(DateTime date);
  DateTime? getTrendingLastRequestDate();
  DateTime? getAnticipatedLastUpdateDate();
}