import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:data/src/database/dao/movie_dao.dart';
import 'package:data/src/database/dto/MovieTrendingDto.dart';

part 'database.g.dart';

@Database(version: 1, entities: [MovieTrendingDto])
abstract class MovieDatabase extends FloorDatabase{
  MovieTrendingDao get movieTrendingDao;
}