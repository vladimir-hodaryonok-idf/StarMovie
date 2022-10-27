import 'package:domain/domain.dart';

class FetchReviewsUseCase implements Mapper<int, Future<List<ReviewMessage>>> {
  final TraktApiNetworkRepository networkRepository;

  const FetchReviewsUseCase(this.networkRepository);

  @override
  Future<List<ReviewMessage>> call(int id) =>
      networkRepository.fetchReviews(id);
}
