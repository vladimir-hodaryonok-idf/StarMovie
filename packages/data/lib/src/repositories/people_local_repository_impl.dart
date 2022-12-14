import 'package:data/src/database/dao/people_dao.dart';
import 'package:data/src/database/dto/people_with_image_dto.dart';
import 'package:domain/domain.dart';

class PeopleLocalRepositoryImpl implements PeopleLocalRepository {
  final PeopleDao peopleDao;

  const PeopleLocalRepositoryImpl({required this.peopleDao});

  @override
  Future<List<PeopleWithImage>> fetchByMovieId(int movieId) async {
    final List<PeopleWithImageDto> cachedPeoples =
        await peopleDao.fetchPeoplesByMovieId(movieId);
    if (cachedPeoples.isNotEmpty) {
      return cachedPeoples.map((e) => e.toPeoplesWithImages()).toList();
    }
    return List.empty();
  }

  @override
  Future<void> saveCast(List<PeopleWithImage> peoples, int id) async {
    final toCacheList =
        peoples.map((e) => PeopleWithImageDto.fromPeopleAndId(e, id)).toList();
    await peopleDao.insertPeople(toCacheList);
  }
}
