import 'package:data/src/request/trakt_api/constants/endpoints.dart';
import 'package:data/src/request/trakt_api/trakt_api_movies.dart';

extension TraktApiEndpointToString on MoviesEndpoint {
  String get string {
    switch (this) {
      case MoviesEndpoint.trending:
        return TraktApiEndpoints.trending;
      case MoviesEndpoint.anticipated:
        return TraktApiEndpoints.anticipated;
    }
  }
}
