import 'package:json_annotation/json_annotation.dart';

part 'profiles.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Profiles {
  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const Profiles({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Profiles.fromJson(Map<String, dynamic> json) =>
      _$ProfilesFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilesToJson(this);
}
