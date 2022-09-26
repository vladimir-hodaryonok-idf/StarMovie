import 'package:domain/src/models/people_model/person.dart';

class PeopleWithImage {
  final String? character;
  final List<String>? characters;
  final Person? person;
  final String imageUrl;

  const PeopleWithImage({
    required this.character,
    required this.characters,
    required this.person,
    required this.imageUrl,
  });
}
