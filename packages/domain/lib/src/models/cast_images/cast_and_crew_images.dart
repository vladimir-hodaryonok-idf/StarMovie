import 'package:domain/src/models/cast_images/profiles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast_and_crew_images.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CastAndCrewImages {

  final int? id;
  final List<Profiles>? profiles;

  const CastAndCrewImages({
    this.id,
    this.profiles,
  });

  factory CastAndCrewImages.fromJson(dynamic json) =>
      _$CastAndCrewImagesFromJson(json);

  Map<String, dynamic> toJson() => _$CastAndCrewImagesToJson(this);
}


