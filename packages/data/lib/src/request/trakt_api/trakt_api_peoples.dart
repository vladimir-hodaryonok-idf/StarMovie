import 'package:data/src/request/api_request_representable.dart';
import 'package:data/src/request/trakt_api/constants/endpoints.dart';

class TraktApiPeoples implements APIRequestRepresentable<String> {
  final int id;

  const TraktApiPeoples._({required this.id});

  const TraktApiPeoples.castAndCrew(int id) : this._(id: id);

  @override
  String? get baseUrl => null;

  @override
  Object? get body => null;

  @override
  Map<String, String>? get headers => null;

  @override
  String get method => DioMethods.get;

  @override
  String get path => '/${id}';

  @override
  Map<String, dynamic>? get query => null;

  @override
  String get url => TraktApiEndpoints.movies + path + TraktApiEndpoints.people;
}
