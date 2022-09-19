import 'package:domain/src/models/cast_images/profiles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast_and_crew_images.g.dart';

@JsonSerializable(fieldRename: FieldRename.screamingSnake)
class CastAndCrewImages {
  CastAndCrewImages({
    this.id,
    this.profiles,
  });

  int? id;
  List<Profiles>? profiles;

  factory CastAndCrewImages.fromJson(dynamic json) =>
      _$CastAndCrewImagesFromJson(json);

  Map<String, dynamic> toJson() => _$CastAndCrewImagesToJson(this);
}

