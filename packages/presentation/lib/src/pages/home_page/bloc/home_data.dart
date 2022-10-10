import 'package:domain/domain.dart';
import 'package:presentation/src/pages/home_page/model/home_page_movie.dart';

enum MovieButtonStatus { trending, anticipated }

class HomePageData {
  final List<HomePageMovie> trending;
  final List<HomePageMovie> anticipated;
  final MovieButtonStatus buttonStatus;
  final List<MovieTrending> trendingFull;
  final List<MovieAnticipated> anticipatedFull;

  const HomePageData({
    required this.trending,
    required this.anticipated,
    required this.buttonStatus,
    required this.trendingFull,
    required this.anticipatedFull,
  });

  List get moviesList =>
      buttonStatus == MovieButtonStatus.trending ? trending : anticipated;

  bool get isDataEmpty => anticipated.isEmpty && trending.isEmpty;

  HomePageData copyWith({
    List<HomePageMovie>? trending,
    List<HomePageMovie>? anticipated,
    MovieButtonStatus? buttonStatus,
    List<MovieTrending>? trendingFull,
    List<MovieAnticipated>? anticipatedFull,
  }) =>
      HomePageData(
        trending: trending ?? this.trending,
        anticipated: anticipated ?? this.anticipated,
        buttonStatus: buttonStatus ?? this.buttonStatus,
        trendingFull: trendingFull ?? this.trendingFull,
        anticipatedFull: anticipatedFull ?? this.anticipatedFull,
      );

  factory HomePageData.init() => HomePageData(
        trending: [],
        anticipated: [],
        buttonStatus: MovieButtonStatus.trending,
        anticipatedFull: [],
        trendingFull: [],
      );
}
