import 'package:json_annotation/json_annotation.dart';

part 'ids.g.dart';

@JsonSerializable()
class Ids {
  final int? trakt;
  final String? slug;
  final String? imdb;
  final int? tmdb;

  Ids(
    this.trakt,
    this.slug,
    this.imdb,
    this.tmdb,
  );

  factory Ids.fromJson(dynamic json) => _$IdsFromJson(json);

  Map<String, dynamic> toJson() => _$IdsToJson(this);
}
