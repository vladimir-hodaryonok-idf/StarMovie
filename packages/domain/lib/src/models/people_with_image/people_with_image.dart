import 'package:domain/src/models/people_model/person.dart';

class PeopleWithImage {
  final String? character;
  final List<String>? characters;
  final Person? person;
  final String imageUrl;

  const PeopleWithImage({
    this.character,
    this.characters,
    this.person,
    this.imageUrl = '',
  });
}
