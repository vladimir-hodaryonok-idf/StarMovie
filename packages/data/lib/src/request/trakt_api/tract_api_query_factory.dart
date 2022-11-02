import 'package:data/src/request/trakt_api/constants/query.dart';

class TraktApiQueryFactory {
  const TraktApiQueryFactory._();

  static Map<String, dynamic> generateMoviesQueryFullWithLimit({int? limit}) =>
      {
        TraktApiQueryKeys.extended: TraktApiQueryValues.full,
        TraktApiQueryKeys.page: null,
        TraktApiQueryKeys.limit: limit,
      };

  static Map<String, dynamic> generateMoviesReviewsFullList() => {
        TraktApiQueryKeys.sort: TraktApiQueryValues.newest,
        TraktApiQueryKeys.extended: TraktApiQueryValues.full,
      };
}
