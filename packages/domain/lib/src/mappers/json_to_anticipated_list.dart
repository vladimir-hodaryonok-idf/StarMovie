import 'package:domain/src/models/movie_model/movie_anticipated.dart';
import 'base_mapper.dart';

class JsonToAnticipatedList extends Mapper<List, List<MovieAnticipated>> {
  @override
  List<MovieAnticipated> call(params) {
    return List.from(
      params.map(
        (e) => MovieAnticipated.fromJson(e),
      ),
    );
  }
}
