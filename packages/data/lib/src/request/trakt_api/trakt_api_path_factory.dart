import 'package:data/src/request/trakt_api/constants/endpoints.dart';

class TraktApiPathFactory {
  const TraktApiPathFactory._();

  static String getTrendingPath() => TraktApiEndpoints.trending;

  static String getAnticipatedPath() => TraktApiEndpoints.anticipated;

  static String getCastAndCrewPath(int id) =>
      TraktApiEndpoints.movies + '/$id' + TraktApiEndpoints.people;

  static String getReviewsPath(int id) =>
      TraktApiEndpoints.movies + '/$id' + TraktApiEndpoints.comments;
}
