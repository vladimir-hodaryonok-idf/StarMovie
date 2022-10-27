import 'package:json_annotation/json_annotation.dart';

part 'review_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReviewUser {
  @JsonKey(name: 'username')
  final String? userName;
  final ReviewImages? images;

  const ReviewUser(this.userName, this.images);

  factory ReviewUser.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewUserToJson(this);
}

@JsonSerializable()
class ReviewImages {
  final ReviewAvatar? avatar;

  const ReviewImages(this.avatar);

  factory ReviewImages.fromJson(Map<String, dynamic> json) =>
      _$ReviewImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewImagesToJson(this);
}

@JsonSerializable()
class ReviewAvatar {
  final String? full;

  const ReviewAvatar(this.full);

  factory ReviewAvatar.fromJson(Map<String, dynamic> json) =>
      _$ReviewAvatarFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewAvatarToJson(this);
}
