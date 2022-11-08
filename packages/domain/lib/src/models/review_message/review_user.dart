class ReviewUser {
  final String? userName;
  final String? imageUrl;

  const ReviewUser(
    this.userName,
    this.imageUrl,
  );

  factory ReviewUser.fromJson(Map<String, dynamic> json) => ReviewUser(
        json['username'] as String?,
        json['images'] == null
            ? null
            : json['images']['avatar']['full'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
      'username': this.userName,
      'images': {
        'avatar': {
          'full': this.imageUrl,
        }
      },
    };
}
