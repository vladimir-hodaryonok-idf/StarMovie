import 'package:presentation/src/pages/home_page/model/home_page_movie.dart';

enum MovieButtonStatus { trending, anticipated }

class HomePageData {
  final List<HomePageMovie> trending;
  final List<HomePageMovie> anticipated;
  final MovieButtonStatus buttonStatus;

  HomePageData({
    required this.trending,
    required this.anticipated,
    required this.buttonStatus,
  });

  List get moviesList =>
      buttonStatus == MovieButtonStatus.trending ? trending : anticipated;

  HomePageData copyWith({
    List<HomePageMovie>? trending,
    List<HomePageMovie>? anticipated,
    MovieButtonStatus? buttonStatus,
  }) =>
      HomePageData(
        trending: trending ?? this.trending,
        anticipated: anticipated ?? this.anticipated,
        buttonStatus: buttonStatus ?? this.buttonStatus,
      );

  factory HomePageData.init() => HomePageData(
        trending: [],
        anticipated: [],
        buttonStatus: MovieButtonStatus.trending,
      );
}
