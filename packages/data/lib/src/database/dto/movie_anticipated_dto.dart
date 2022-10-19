import 'package:domain/domain.dart';
import 'package:floor/floor.dart';

@entity
class MovieAnticipatedDto {
  final int listCount;
  final String? title;
  final int? year;
  @PrimaryKey(autoGenerate: false)
  final int? trakt;
  final String? slug;
  final String? imdb;
  final int? tmdb;
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
  final int? commentCount;
  final String? updatedAt;
  final String? language;
  final List<String>? availableTranslations;
  final List<String>? genres;
  final String? certification;

  const MovieAnticipatedDto(
    this.listCount,
    this.title,
    this.year,
    this.trakt,
    this.slug,
    this.imdb,
    this.tmdb,
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
  );

  factory MovieAnticipatedDto.fromAnticipated(MovieAnticipated anticipated) =>
      MovieAnticipatedDto(
        anticipated.listCount,
        anticipated.movie.title,
        anticipated.movie.year,
        anticipated.movie.ids?.trakt,
        anticipated.movie.ids?.slug,
        anticipated.movie.ids?.imdb,
        anticipated.movie.ids?.tmdb,
        anticipated.movie.tagline,
        anticipated.movie.overview,
        anticipated.movie.released,
        anticipated.movie.runtime,
        anticipated.movie.country,
        anticipated.movie.trailer,
        anticipated.movie.homepage,
        anticipated.movie.status,
        anticipated.movie.rating,
        anticipated.movie.votes,
        anticipated.movie.commentCount,
        anticipated.movie.updatedAt,
        anticipated.movie.language,
        anticipated.movie.availableTranslations,
        anticipated.movie.genres,
        anticipated.movie.certification,
      );

  MovieAnticipated toMovieAnticipated() => MovieAnticipated(
        Movie(
          title,
          year,
          Ids(
            trakt,
            slug,
            imdb,
            tmdb,
          ),
          tagline,
          overview,
          released,
          runtime,
          country,
          trailer,
          homepage,
          status,
          rating,
          votes,
          commentCount,
          updatedAt,
          language,
          availableTranslations,
          genres,
          certification,
        ),
        listCount,
      );
}
