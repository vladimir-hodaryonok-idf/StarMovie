import 'package:domain/src/models/people_model/cast.dart';
import 'package:json_annotation/json_annotation.dart';
import 'crew_member.dart';

part 'crew_and_cast.g.dart';

@JsonSerializable()
class CrewAndCast {
  final List<Cast>? cast;
  final Map<String,List<CrewMember>?>? crew;

  const CrewAndCast({
    this.cast,
    this.crew,
  });

  factory CrewAndCast.fromJson(Map<String, dynamic> json) =>
      _$CrewAndCastFromJson(json);

  Map<String, dynamic> toJson() => _$CrewAndCastToJson(this);
}
