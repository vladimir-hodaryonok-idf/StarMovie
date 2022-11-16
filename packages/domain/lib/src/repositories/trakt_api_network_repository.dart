import 'package:domain/domain.dart';

abstract class TraktApiNetworkRepository {
  Future<ListResponseModel> fetchAnticipatedMovies({int? limit});

  Future<ListResponseModel> fetchTrendingMovies({int? limit});

  Future<CrewAndCast> fetchCrewAndCast(int id);

  Future<List<ReviewMessage>> fetchReviews(int id);
}
