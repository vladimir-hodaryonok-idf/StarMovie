import 'package:domain/src/models/movie_model/movie/ids.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

const imageUrl = 'http://img.omdbapi.com/?apikey=5e582eee&i=';

@JsonSerializable()
class Movie {
  final String? title;
  final int? year;
  final Ids? ids;
  final String? tagline;
  final String? overview;
  final String? released;
  final int? runtime;
  final String? country;
  final String? trailer;
  final String? homepage;
  final String? status;
  final double? rating;
  final int? votes;
  @JsonKey(name: 'comment_count')
  final int? commentCount;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final String? language;
  @JsonKey(name: 'available_translations')
  final List<String>? availableTranslations;
  final List<String>? genres;
  final String? certification;
  final String image;
  final int stars;

  Movie(
    this.title,
    this.year,
    this.ids,
    this.tagline,
    this.overview,
    this.released,
    this.runtime,
    this.country,
    this.trailer,
    this.homepage,
    this.status,
    this.rating,
    this.votes,
    this.commentCount,
    this.updatedAt,
    this.language,
    this.availableTranslations,
    this.genres,
    this.certification,
  )   : image = '$imageUrl${ids?.imdb}',
        stars = rating == null ? 0 : (rating / 2).round();

  factory Movie.fromJson(dynamic json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
