import 'dart:async';
import 'package:data/src/database/dto/date_dto.dart';
import 'package:floor/floor.dart';

@dao
abstract class DateDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveTrendingDate(DateDto date);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveAnticipatedDate(DateDto date);

  @Query('SELECT * FROM DateDto WHERE key = :key')
  Future<DateDto?> getDateByKey(int key);
}
