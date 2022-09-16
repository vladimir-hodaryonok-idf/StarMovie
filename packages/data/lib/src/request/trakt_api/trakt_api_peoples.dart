import 'package:data/src/request/api_request_representable.dart';
import 'package:data/src/request/trakt_api/constants/endpoints.dart';
import 'package:data/src/request/trakt_api/constants/headers.dart';
import 'package:domain/domain.dart';

class TraktApiPeoples implements APIRequestRepresentable {
  final int id;

  TraktApiPeoples._({required this.id});

  TraktApiPeoples.castAndCrew(int id) : this._(id: id);

  @override
  String? get baseUrl => null;

  @override
  get body => null;

  @override
  Map<String, String>? get headers => {
        TraktApiHeadersKeys.apiKey: ApiKeys.traktApiKey,
      };

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get path => '/${id}';

  @override
  Map<String, dynamic>? get query => null;

  @override
  String get url => TraktApiEndpoints.movies + path + TraktApiEndpoints.people;
}
