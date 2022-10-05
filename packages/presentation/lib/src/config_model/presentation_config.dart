class PresentationConfig {
  final String title;

  const PresentationConfig(this.title);

  factory PresentationConfig.fromJson(
    Map<String, dynamic> json,
  ) =>
      PresentationConfig(json['title']);
}
