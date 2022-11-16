import 'package:domain/src/models/people_model/cast_and_crew_member.dart';
import 'package:domain/src/models/people_model/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast extends CastAndCrewMember {
  final String? character;
  final List<String>? characters;
  final Person? person;

  const Cast({
    this.character,
    this.characters,
    this.person,
  }) : super(
          character,
          characters,
          person,
        );

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
