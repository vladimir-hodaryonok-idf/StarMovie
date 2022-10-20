import 'package:json_annotation/json_annotation.dart';

part 'ids.g.dart';

@JsonSerializable()
class PeopleIds {
  final int? trakt;
  final String? slug;
  final String? imdb;
  final int? tmdb;
  final int? tvrage;

  const PeopleIds({
    this.trakt,
    this.slug,
    this.imdb,
    this.tmdb,
    this.tvrage,
  });

  factory PeopleIds.fromJson(Map<String, dynamic> json) => _$PeopleIdsFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleIdsToJson(this);
}
