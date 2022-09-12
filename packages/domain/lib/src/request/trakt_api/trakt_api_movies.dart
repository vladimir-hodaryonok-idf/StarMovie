import 'package:domain/src/request/api_request_representable.dart';
import 'package:domain/src/api_key/api_keys.dart';
import 'package:domain/src/request/trakt_api/extensions/movies_ext.dart';
import 'package:domain/src/request/trakt_api/constants/headers.dart';
import 'package:domain/src/request/trakt_api/constants/query.dart';

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
        TraktApiHeadersKeys.contentType: TraktApiHeadersValues.json,
        TraktApiHeadersKeys.apiVersion: TraktApiHeadersValues.apiVersion,
        TraktApiHeadersKeys.apiKey: ApiKeys.key,
      };

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String? get path => null;
}
