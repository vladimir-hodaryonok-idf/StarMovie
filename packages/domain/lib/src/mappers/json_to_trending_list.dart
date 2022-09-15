import 'package:domain/src/mappers/base_mapper.dart';
import 'package:domain/src/models/movie_model/movie_trending.dart';

class JsonToTrendingList extends Mapper<dynamic, List<MovieTrending>> {
  @override
  List<MovieTrending> call(params) {
    return List.from(
      (params as List<dynamic>).map(
        (e) => MovieTrending.fromJson(e),
      ),
    );
  }
}
