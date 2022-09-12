// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ids.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ids _$IdsFromJson(Map<String, dynamic> json) => Ids(
      json['trakt'] as int?,
      json['slug'] as String?,
      json['imdb'] as String?,
      json['tmdb'] as int?,
    );

Map<String, dynamic> _$IdsToJson(Ids instance) => <String, dynamic>{
      'trakt': instance.trakt,
      'slug': instance.slug,
      'imdb': instance.imdb,
      'tmdb': instance.tmdb,
    };
