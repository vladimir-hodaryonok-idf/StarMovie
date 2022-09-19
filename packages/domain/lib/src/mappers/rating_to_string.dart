import 'package:domain/src/mappers/base_mapper.dart';

class RatingToStringMapper extends Mapper<double, String> {
  @override
  String call(double rating) => '${(rating / 2).toStringAsFixed(1)}/5';
}
