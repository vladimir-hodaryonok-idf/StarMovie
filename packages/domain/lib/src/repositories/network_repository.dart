import 'package:domain/domain.dart';

abstract class NetworkRepository {
  Future<ListResponseModel> fetchAnticipatedMovies({int? limit});

  Future<ListResponseModel> fetchTrendingMovies({int? limit});
}
