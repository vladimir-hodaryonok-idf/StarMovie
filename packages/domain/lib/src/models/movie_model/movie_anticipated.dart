import 'package:json_annotation/json_annotation.dart';
import 'movie/movie.dart';

part 'movie_anticipated.g.dart';

@JsonSerializable()
class MovieAnticipated {
  final int list_count;
  final Movie movie;

  MovieAnticipated(
    this.movie,
    this.list_count,
  );

  factory MovieAnticipated.fromJson(dynamic json) =>
      _$MovieAnticipatedFromJson(json);

  Map<String, dynamic> toJson() => _$MovieAnticipatedToJson(this);
}
