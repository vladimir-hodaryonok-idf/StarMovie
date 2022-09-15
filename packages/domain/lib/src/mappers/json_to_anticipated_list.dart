import '../models/movie_model/movie_anticipated.dart';
import 'base_mapper.dart';

class JsonToAnticipatedList extends Mapper<dynamic, List<MovieAnticipated>> {
  @override
  List<MovieAnticipated> call(params) {
    return List.from(
      (params as List<dynamic>).map(
        (e) => MovieAnticipated.fromJson(e),
      ),
    );
  }
}
