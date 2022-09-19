import 'package:json_annotation/json_annotation.dart';

part 'profiles.g.dart';

@JsonSerializable(fieldRename: FieldRename.screamingSnake)
class Profiles {
  Profiles({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  double? aspectRatio;
  int? height;
  dynamic iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  factory Profiles.fromJson(dynamic json) => _$ProfilesFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilesToJson(this);
}