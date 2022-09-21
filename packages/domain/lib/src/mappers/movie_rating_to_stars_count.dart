import 'package:domain/src/mappers/base_mapper.dart';

class MovieRatingToStarsCountMapper extends Mapper<double, int> {
  @override
  int call(double params) => (params / 2).round();
}
