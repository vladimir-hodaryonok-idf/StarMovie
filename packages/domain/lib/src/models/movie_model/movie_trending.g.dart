// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieTrending _$MovieTrendingFromJson(Map<String, dynamic> json) =>
    MovieTrending(
      Movie.fromJson(json['movie']),
      json['watchers'] as int,
    );

Map<String, dynamic> _$MovieTrendingToJson(MovieTrending instance) =>
    <String, dynamic>{
      'watchers': instance.watchers,
      'movie': instance.movie,
    };
