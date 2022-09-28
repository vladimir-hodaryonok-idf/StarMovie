import 'package:domain/src/models/people_model/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  final String? character;
  final List<String>? characters;
  final Person? person;

  const Cast({
    this.character,
    this.characters,
    this.person,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
