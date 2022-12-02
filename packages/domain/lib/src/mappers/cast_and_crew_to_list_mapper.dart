import 'package:domain/domain.dart';
import 'package:domain/src/models/people_model/cast_and_crew_member.dart';

class CastAndCrewToListMapper
    implements Mapper<CrewAndCast, List<CastAndCrewMember>> {
  @override
  List<CastAndCrewMember> call(CrewAndCast crewAndCast) {
    if (crewAndCast.cast != null && crewAndCast.crew != null) {
      final List<CastAndCrewMember> result = List.from(crewAndCast.cast!);
      crewAndCast.crew!.values.forEach(
        (element) {
          if (element != null) result.addAll(element);
        },
      );
      return result;
    }
    return List.empty();
  }
}
