import 'package:domain/src/models/review_message/review_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_message.g.dart';

@JsonSerializable()
class ReviewMessage {
  @JsonKey(name: 'comment')
  final String? message;
  @JsonKey(name: 'created_at')
  final String? created;
  final int? user_rating;
  final ReviewUser? user;

  const ReviewMessage(
    this.message,
    this.created,
    this.user_rating,
    this.user,
  );

  factory ReviewMessage.fromJson(Map<String, dynamic> json) =>
      _$ReviewMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewMessageToJson(this);
}
