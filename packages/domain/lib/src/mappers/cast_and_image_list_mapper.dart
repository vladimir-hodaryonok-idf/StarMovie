import 'package:domain/domain.dart';
import 'package:domain/src/mappers/base_mapper_two_input_items.dart';
import 'package:domain/src/models/people_model/cast.dart';
import 'package:collection/collection.dart';

const _imageUrl = 'http://image.tmdb.org/t/p/w185';

class CastAndImagesListMapper extends BaseMapperWithTwoInput<List<Cast>,
    List<CastAndCrewImages>, List<PeopleWithImage>> {
  @override
  List<PeopleWithImage> call(
    List<Cast> peoples,
    List<CastAndCrewImages> images,
  ) {
    if (peoples.isEmpty || images.isEmpty) return List.empty();
    return images.map(
      (image) {
        final Cast people = peoples.firstWhere(
          (element) {
            return element.person?.ids?.tmdb == image.id;
          },
          orElse: () => Cast(),
        );
        return PeopleWithImage(
          character: people.character,
          characters: people.characters,
          person: people.person,
          imageUrl:
              _imageUrl + (image.profiles?.firstOrNull?.filePath).stringOrEmpty,
        );
      },
    ).toList();
  }
}
