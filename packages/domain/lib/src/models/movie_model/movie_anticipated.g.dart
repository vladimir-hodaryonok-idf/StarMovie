// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_anticipated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieAnticipated _$MovieAnticipatedFromJson(Map<String, dynamic> json) =>
    MovieAnticipated(
      Movie.fromJson(json['movie']),
      json['list_count'] as int,
    );

Map<String, dynamic> _$MovieAnticipatedToJson(MovieAnticipated instance) =>
    <String, dynamic>{
      'list_count': instance.list_count,
      'movie': instance.movie,
    };
