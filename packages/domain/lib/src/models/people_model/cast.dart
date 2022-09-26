import 'package:domain/src/models/people_model/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {

  final String? character;
  final List<String>? characters;
  final Person? person;

  factory Cast.fromJson(dynamic json) => _$CastFromJson(json);
  const Cast({
    this.character,
    this.characters,
    this.person,
  });

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
