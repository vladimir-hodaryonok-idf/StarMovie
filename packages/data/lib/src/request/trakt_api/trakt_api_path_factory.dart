import 'package:data/src/request/trakt_api/constants/endpoints.dart';

class TraktApiPathFactory {
  const TraktApiPathFactory._();

  static getTrendingPath() => TraktApiEndpoints.trending;

  static getAnticipatedPath() => TraktApiEndpoints.anticipated;

  static getCastAndCrewPath(int id) =>
      TraktApiEndpoints.movies + '/${id}' + TraktApiEndpoints.people;
}
