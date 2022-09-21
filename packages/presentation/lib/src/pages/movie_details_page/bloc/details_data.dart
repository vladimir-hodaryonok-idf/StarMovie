import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';
import 'package:presentation/src/pages/movie_details_page/model/movie_details.dart';

enum DetailsSwitcher {
  detail,
  reviews,
  showtime;
}

class DetailsData {
  final MovieDetails? movieDetails;
  final List<CrewAndCastUi> crewAndCast;
  final DetailsSwitcher detailsSwitcher;

  DetailsData({
    required this.movieDetails,
    required this.crewAndCast,
    required this.detailsSwitcher,
  });

  factory DetailsData.init() => DetailsData(
      movieDetails: null,
      crewAndCast: [],
      detailsSwitcher: DetailsSwitcher.detail);

  DetailsData copyWith({
    MovieDetails? movieDetails,
    List<CrewAndCastUi>? crewAndCast,
    DetailsSwitcher? detailsSwitcher,
  }) =>
      DetailsData(
        movieDetails: movieDetails ?? this.movieDetails,
        crewAndCast: crewAndCast ?? this.crewAndCast,
        detailsSwitcher: detailsSwitcher ?? this.detailsSwitcher,
      );
}
