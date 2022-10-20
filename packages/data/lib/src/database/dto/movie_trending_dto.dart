import 'package:domain/domain.dart';
import 'package:floor/floor.dart';

@entity
class MovieTrendingDto {
  final int watchers;
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

  const MovieTrendingDto(
    this.watchers,
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

  factory MovieTrendingDto.fromTrending(MovieTrending trending) =>
      MovieTrendingDto(
        trending.watchers,
        trending.movie.title,
        trending.movie.year,
        trending.movie.ids?.trakt,
        trending.movie.ids?.slug,
        trending.movie.ids?.imdb,
        trending.movie.ids?.tmdb,
        trending.movie.tagline,
        trending.movie.overview,
        trending.movie.released,
        trending.movie.runtime,
        trending.movie.country,
        trending.movie.trailer,
        trending.movie.homepage,
        trending.movie.status,
        trending.movie.rating,
        trending.movie.votes,
        trending.movie.commentCount,
        trending.movie.updatedAt,
        trending.movie.language,
        trending.movie.availableTranslations,
        trending.movie.genres,
        trending.movie.certification,
      );

  MovieTrending toMovieTrending() => MovieTrending(
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
        watchers,
      );
}

