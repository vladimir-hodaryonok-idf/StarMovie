import 'package:domain/src/models/people_model/person.dart';

class PeopleWithImage {
  final String? activity;
  final List<String>? activities;
  final Person? person;
  final String imageUrl;

  const PeopleWithImage({
    this.activities,
    this.person,
    this.imageUrl = '',
    this.activity,
  });
}
