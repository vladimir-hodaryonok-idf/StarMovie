import 'package:data/src/request/api_request_representable.dart';
import 'package:data/src/request/trakt_api/constants/query.dart';
import 'package:data/src/request/trakt_api/constants/endpoints.dart';

class TraktApiMovies implements APIRequestRepresentable<DioMethods> {
  final String endPoint;
  final int? _itemLimit;

  TraktApiMovies._(this.endPoint, this._itemLimit);

  TraktApiMovies.trending({int? limit})
      : this._(TraktApiEndpoints.trending, limit);

  TraktApiMovies.anticipated({int? limit})
      : this._(TraktApiEndpoints.anticipated, limit);

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
  String get url => endPoint;

  @override
  Map<String, String>? get headers => null;

  @override
  dynamic get method => DioMethods.get;

  @override
  String? get path => null;
}
