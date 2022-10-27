import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';
import 'package:presentation/src/pages/movie_details_page/model/movie_details.dart';
import 'package:presentation/src/pages/movie_details_page/model/review_messages_ui.dart';

enum DetailsSwitcher {
  detail,
  reviews,
  showtime;
}

class DetailsData {
  final MovieDetails? movieDetails;
  final List<CrewAndCastUi> crewAndCast;
  final DetailsSwitcher detailsSwitcher;
  final List<ReviewMessageUi> reviews;

  const DetailsData({
    required this.movieDetails,
    required this.crewAndCast,
    required this.detailsSwitcher,
    required this.reviews,
  });

  factory DetailsData.init() => DetailsData(
        movieDetails: null,
        crewAndCast: List.empty(),
        detailsSwitcher: DetailsSwitcher.detail,
        reviews: List.empty(),
      );

  DetailsData copyWith({
    MovieDetails? movieDetails,
    List<CrewAndCastUi>? crewAndCast,
    DetailsSwitcher? detailsSwitcher,
    List<ReviewMessageUi>? reviews,
  }) =>
      DetailsData(
        movieDetails: movieDetails ?? this.movieDetails,
        crewAndCast: crewAndCast ?? this.crewAndCast,
        detailsSwitcher: detailsSwitcher ?? this.detailsSwitcher,
        reviews: reviews ?? this.reviews,
      );
}
