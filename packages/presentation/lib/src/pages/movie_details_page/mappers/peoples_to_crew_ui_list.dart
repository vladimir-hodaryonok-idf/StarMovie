import 'package:domain/domain.dart';
import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';

class PeoplesToCrewUiMapper extends Mapper<List<PeopleWithImage>, List<CrewAndCastUi>> {
  @override
  List<CrewAndCastUi> call(List<PeopleWithImage> cast) => cast.map(
        (e) => CrewAndCastUi(
      imageUrl: e.imageUrl,
      personName: e.person?.name ?? '',
      role: e.characters.firstOrEmpty,
    ),
  ).toList();
}