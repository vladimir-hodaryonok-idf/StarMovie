class PresentationConfig {
  final String title;

  const PresentationConfig(this.title);

  factory PresentationConfig.fromJson(
    Map<String, dynamic> json,
    String flavor,
  ) {
    const prod = 'prod';
    switch(flavor){
      case prod:
        return PresentationConfig(
          json['prodTitle'],
        );
      default:
        return PresentationConfig(
          json['sandBoxTitle'],
        );
    }
  }
}
