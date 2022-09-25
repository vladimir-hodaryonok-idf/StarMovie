import 'package:domain/src/models/people_model/cast.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crew_and_cast.g.dart';

@JsonSerializable()
class CrewAndCast {
  CrewAndCast({
    this.cast,
  });

  final List<Cast>? cast;

  factory CrewAndCast.fromJson(dynamic json) => _$CrewAndCastFromJson(json);

  Map<String, dynamic> toJson() => _$CrewAndCastToJson(this);
}
