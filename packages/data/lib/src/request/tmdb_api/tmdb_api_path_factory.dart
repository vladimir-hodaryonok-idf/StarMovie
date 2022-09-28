import 'package:data/src/request/tmdb_api/constants/endpoints.dart';

class TmdbApiPathFactory {
  const TmdbApiPathFactory._();

  static getCrewAndCastImagesPath({int? id}) =>
      TmdbApiEndpoints.person + '/$id' + TmdbApiEndpoints.images;
}
