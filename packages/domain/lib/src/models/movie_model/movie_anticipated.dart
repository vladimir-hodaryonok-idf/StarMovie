import 'package:json_annotation/json_annotation.dart';
import 'movie/movie.dart';

part 'movie_anticipated.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieAnticipated {
  final int listCount;
  final Movie movie;

  const MovieAnticipated(
    this.movie,
    this.listCount,
  );

  factory MovieAnticipated.fromJson(Map<String, dynamic> json) =>
      _$MovieAnticipatedFromJson(json);

  Map<String, dynamic> toJson() => _$MovieAnticipatedToJson(this);
}
