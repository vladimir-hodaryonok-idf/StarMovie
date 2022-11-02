import 'package:domain/domain.dart';
import 'package:intl/intl.dart';
import 'package:presentation/src/pages/movie_details_page/model/review_messages_ui.dart';

class ReviewsToReviewsUiMapper
    implements Mapper<List<ReviewMessage>, List<ReviewMessageUi>> {
  final MovieRatingToStarsCountMapper _ratingToStarsCount;

  const ReviewsToReviewsUiMapper(this._ratingToStarsCount);

  @override
  List<ReviewMessageUi> call(List<ReviewMessage> params) =>
      params.map((e) => _map(e)).toList();

  ReviewMessageUi _map(ReviewMessage review) {
    final dateTime = DateTime.tryParse(review.created.valueOrEmpty);
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final String dateString =
        dateTime != null ? formatter.format(dateTime) : '';

    return ReviewMessageUi(
      review.message.valueOrEmpty,
      dateString,
      _ratingToStarsCount(review.user_rating.toIntOrNil().toDouble()),
      (review.user?.userName).valueOrEmpty,
      review.user?.imageUrl,
    );
  }
}
