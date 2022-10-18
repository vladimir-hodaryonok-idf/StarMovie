import 'package:domain/domain.dart';
import 'package:floor/floor.dart';

@entity
class MovieTrendingDto {
  @PrimaryKey(autoGenerate: true)
  final int id = 0;
  final int watchers;
  // final MovieDto movie;

  const MovieTrendingDto(
    // this.movie,
    this.watchers,
  ) ;
}

// @entity
// class MovieDto extends Movie {
//   MovieDto(
//     super.title,
//     super.year,
//     super.ids,
//     super.tagline,
//     super.overview,
//     super.released,
//     super.runtime,
//     super.country,
//     super.trailer,
//     super.homepage,
//     super.status,
//     super.rating,
//     super.votes,
//     super.commentCount,
//     super.updatedAt,
//     super.language,
//     super.availableTranslations,
//     super.genres,
//     super.certification,
//   );
// }
