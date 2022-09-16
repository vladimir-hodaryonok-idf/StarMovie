import 'package:domain/src/mappers/base_mapper.dart';

class RatingToStringMapper extends Mapper<double?, String> {
  @override
  String call(double? rating) {
    final value = rating == null ? 0 : (rating / 2).toStringAsFixed(1);
    return '${value}/5';
  }
}
