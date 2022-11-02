import 'package:domain/domain.dart';

class FetchReviewsUseCase implements Mapper<int, Future<List<ReviewMessage>>> {
  final TraktApiNetworkRepository _networkRepository;

  const FetchReviewsUseCase(this._networkRepository);

  @override
  Future<List<ReviewMessage>> call(int id) =>
      _networkRepository.fetchReviews(id);
}
