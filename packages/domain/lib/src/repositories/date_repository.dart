abstract class DateRepository {
  Future<void> saveTrendingLastUpdateFromApiDate(DateTime date);

  Future<void> saveAnticipatedLastUpdateFromApiDate(DateTime date);

  Future<DateTime?> getTrendingLastRequestDate();

  Future<DateTime?> getAnticipatedLastUpdateDate();
}
