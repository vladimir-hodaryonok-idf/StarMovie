import 'package:json_annotation/json_annotation.dart';
import 'package:domain/src/models/people_model/crew_member.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  Crew({
    this.writing,
    this.crew,
    this.art,
    this.production,
    this.costumeMakeup,
    this.editing,
    this.sound,
    this.directing,
    this.camera,
    this.lighting,
  });

  List<CrewMember>? writing;
  List<CrewMember>? crew;
  List<CrewMember>? art;
  List<CrewMember>? production;
  @JsonKey(name: 'costume & make-up')
  List<CrewMember>? costumeMakeup;
  List<CrewMember>? editing;
  List<CrewMember>? sound;
  List<CrewMember>? directing;
  List<CrewMember>? camera;
  List<CrewMember>? lighting;

  factory Crew.fromJson(dynamic json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
