import 'package:domain/domain.dart';

abstract class NetworkRepository {
  Future<ResponseModel> fetchAnticipatedMovies({int? limit});

  Future<ResponseModel> fetchTrendingMovies({int? limit});
}
