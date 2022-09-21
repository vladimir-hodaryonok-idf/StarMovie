import 'package:domain/src/mappers/base_mapper.dart';
import 'package:domain/src/models/movie_model/movie_trending.dart';

class JsonToTrendingList extends Mapper<List, List<MovieTrending>> {
  @override
  List<MovieTrending> call(params) {
    return List.from(
      params.map(
        (e) => MovieTrending.fromJson(e),
      ),
    );
  }
}
