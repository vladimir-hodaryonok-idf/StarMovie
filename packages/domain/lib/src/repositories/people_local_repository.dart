import 'package:domain/src/models/people_with_image/people_with_image.dart';

abstract class PeopleLocalRepository{
  Future<void> saveCast(List<PeopleWithImage> cast, int id);
  Future<List<PeopleWithImage>> fetchByMovieId(int movieId);
}