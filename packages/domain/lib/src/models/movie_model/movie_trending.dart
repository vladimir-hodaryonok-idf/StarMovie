import 'package:json_annotation/json_annotation.dart';

import 'movie/movie.dart';

part 'movie_trending.g.dart';

@JsonSerializable()
class MovieTrending {
  final int watchers;
  final Movie movie;

  MovieTrending(
    this.movie,
    this.watchers,
  );

  factory MovieTrending.fromJson(dynamic json) => _$MovieTrendingFromJson(json);

  Map<String, dynamic> toJson() => _$MovieTrendingToJson(this);
}
