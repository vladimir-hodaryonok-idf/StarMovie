import 'dart:async';
import 'package:data/src/database/dao/people_dao.dart';
import 'package:data/src/database/type_converters/list_to_string_converter.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:data/src/database/dao/movie_dao.dart';
import 'package:data/src/database/dto/movie_trending_dto.dart';

import 'dto/movie_anticipated_dto.dart';
import 'dto/people_with_image.dart';

part 'database.g.dart';

@TypeConverters([ListToStringConverter])
@Database(version: 1, entities: [
  MovieTrendingDto,
  MovieAnticipatedDto,
  PeopleWithImageDto,
])
abstract class MovieDatabase extends FloorDatabase {
  MovieDao get movieDao;
  PeopleDao get peopleDao;
}
