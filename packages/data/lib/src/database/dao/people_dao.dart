import 'package:data/src/database/dto/people_with_image_dto.dart';
import 'package:floor/floor.dart';

@dao
abstract class PeopleDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertPeople(List<PeopleWithImageDto> peoples);

  @Query('SELECT * FROM PeopleWithImageDto WHERE movieId = :movieId')
  Future<List<PeopleWithImageDto>> fetchPeoplesByMovieId(int movieId);
}
