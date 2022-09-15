import 'package:domain/src/models/people_model/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crew_member.g.dart';

@JsonSerializable()
class CrewMember {
  CrewMember({
    this.job,
    this.jobs,
    this.person,
  });

  final Person? person;
  final List<String>? jobs;
  final String? job;

  factory CrewMember.fromJson(dynamic json) => _$CrewMemberFromJson(json);

  Map<String, dynamic> toJson() => _$CrewMemberToJson(this);
}
