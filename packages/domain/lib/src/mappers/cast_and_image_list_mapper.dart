import 'package:domain/domain.dart';
import 'package:domain/src/models/data_wrapper/cast_and_images_wrapper.dart';
import 'package:collection/collection.dart';

const _imageUrl = 'http://image.tmdb.org/t/p/w185';

class CastAndImagesMapper extends Mapper<CastAndImageWrapper, PeopleWithImage> {
  @override
  PeopleWithImage call(CastAndImageWrapper data) => PeopleWithImage(
        activity: data.people.activity,
        activities: data.people.activities,
        person: data.people.person,
        imageUrl: _imageUrl +
            (data.images.profiles?.firstOrNull?.filePath).stringOrEmpty,
      );
}
