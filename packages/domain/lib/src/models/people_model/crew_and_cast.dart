import 'package:domain/src/models/people_model/cast.dart';
import 'package:domain/src/models/people_model/crew.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crew_and_cast.g.dart';

@JsonSerializable()
class CrewAndCast {
  CrewAndCast({
    this.cast,
    this.crew,
  });

  final List<Cast>? cast;
  final Crew? crew;

  factory CrewAndCast.fromJson(dynamic json) => _$CrewAndCastFromJson(json);

  Map<String, dynamic> toJson() => _$CrewAndCastToJson(this);
}
