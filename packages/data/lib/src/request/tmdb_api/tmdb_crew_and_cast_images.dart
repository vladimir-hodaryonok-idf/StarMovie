import 'package:data/src/request/api_request_representable.dart';
import 'package:data/src/request/tmdb_api/constants/endpoints.dart';

class TmdbCrewAndCastImages implements APIRequestRepresentable<DioMethods>{
  final int id;
  TmdbCrewAndCastImages._({required this.id});
  TmdbCrewAndCastImages.byId(int id) : this._(id: id);

  @override
  String? get baseUrl => null;

  @override
  get body => null;

  @override
  Map<String, String>? get headers => null;

  @override
  get method => DioMethods.get;

  @override
  String get path => '/$id';

  @override
  Map<String, dynamic>? get query => null;

  @override
  String get url => TmdbApiEndpoints.person + path + TmdbApiEndpoints.images;

}