import 'package:domain/domain.dart';
import 'package:domain/src/api_key/api_keys.dart';
import 'package:domain/src/request/trakt_api/constants/endpoints.dart';
import 'package:domain/src/request/trakt_api/constants/headers.dart';

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
        TraktApiHeadersKeys.contentType: TraktApiHeadersValues.json,
        TraktApiHeadersKeys.apiVersion: TraktApiHeadersValues.apiVersion,
        TraktApiHeadersKeys.apiKey: ApiKeys.key,
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
