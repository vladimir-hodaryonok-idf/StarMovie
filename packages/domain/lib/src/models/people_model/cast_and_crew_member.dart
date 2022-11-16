import 'package:domain/src/models/people_model/person.dart';

abstract class CastAndCrewMember {
  final String? activity;
  final List<String>? activities;
  final Person? person;

  const CastAndCrewMember(
    this.activity,
    this.activities,
    this.person,
  );
}
