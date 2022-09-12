// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['title'] as String?,
      json['year'] as int?,
      json['ids'] == null ? null : Ids.fromJson(json['ids']),
      json['tagline'] as String?,
      json['overview'] as String?,
      json['released'] as String?,
      json['runtime'] as int?,
      json['country'] as String?,
      json['trailer'] as String?,
      json['homepage'] as String?,
      json['status'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['votes'] as int?,
      json['comment_count'] as int?,
      json['updated_at'] as String?,
      json['language'] as String?,
      (json['available_translations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['certification'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'ids': instance.ids,
      'tagline': instance.tagline,
      'overview': instance.overview,
      'released': instance.released,
      'runtime': instance.runtime,
      'country': instance.country,
      'trailer': instance.trailer,
      'homepage': instance.homepage,
      'status': instance.status,
      'rating': instance.rating,
      'votes': instance.votes,
      'comment_count': instance.commentCount,
      'updated_at': instance.updatedAt,
      'language': instance.language,
      'available_translations': instance.availableTranslations,
      'genres': instance.genres,
      'certification': instance.certification,
    };
