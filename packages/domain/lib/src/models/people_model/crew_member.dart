import 'package:domain/src/models/people_model/person.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cast_and_crew_member.dart';

part 'crew_member.g.dart';

@JsonSerializable()
class CrewMember extends CastAndCrewMember {
  final String? job;
  final List<String>? jobs;
  final Person? person;

  const CrewMember(
    this.job,
    this.jobs,
    this.person,
  ) : super(
          job,
          jobs,
          person,
        );

  factory CrewMember.fromJson(Map<String, dynamic> json) =>
      _$CrewMemberFromJson(json);

  Map<String, dynamic> toJson() => _$CrewMemberToJson(this);
}
