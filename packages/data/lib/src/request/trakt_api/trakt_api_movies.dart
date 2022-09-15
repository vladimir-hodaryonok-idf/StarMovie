import 'package:data/src/request/api_request_representable.dart';
import 'package:data/src/request/trakt_api/constants/headers.dart';
import 'package:data/src/request/trakt_api/constants/query.dart';
import 'package:data/src/request/trakt_api/extensions/movies_ext.dart';
import 'package:domain/src/json/yaml/properties.dart';

enum MoviesEndpoint { trending, anticipated }

class TraktApiMovies implements APIRequestRepresentable {
  final MoviesEndpoint endPoint;
  final int? _itemLimit;

  TraktApiMovies._(this.endPoint, this._itemLimit);

  TraktApiMovies.trending({int? limit})
      : this._(MoviesEndpoint.trending, limit);

  TraktApiMovies.anticipated({int? limit})
      : this._(MoviesEndpoint.anticipated, limit);

  @override
  String? get baseUrl => null;

  @override
  get body => null;

  @override
  Map<String, dynamic>? get query => {
        TraktApiQueryKeys.extended: TraktApiQueryValues.full,
        TraktApiQueryKeys.page: null,
        TraktApiQueryKeys.limit: _itemLimit,
      };

  @override
  String get url => endPoint.string;

  @override
  Map<String, String>? get headers => {
        TraktApiHeadersKeys.apiKey: ApiKeys.traktApiKey,
      };

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String? get path => null;
}
