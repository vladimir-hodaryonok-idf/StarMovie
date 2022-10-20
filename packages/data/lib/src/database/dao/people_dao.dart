import 'package:data/src/database/dto/people_with_image.dart';
import 'package:floor/floor.dart';

@dao
abstract class PeopleDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertPeoples(List<PeopleWithImageDto> peoples);

  @Query('SELECT * FROM PeopleWithImageDto WHERE movieId = :movieId')
  Future<List<PeopleWithImageDto>> fetchPeoplesByMovieId(int movieId);

  @Query('DELETE FROM PeopleWithImageDto')
  Future<void> clearPeoples();
}
