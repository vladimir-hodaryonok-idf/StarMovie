import 'package:domain/src/models/cast_images/cast_and_crew_images.dart';
import 'package:domain/src/models/people_model/cast.dart';

class CastAndImageWrapper {
  final Cast people;
  final CastAndCrewImages images;

  const CastAndImageWrapper({
    required this.people,
    required this.images,
  });
}
