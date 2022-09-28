import 'package:domain/domain.dart';

class RatingToStringMapper implements Mapper<double, String> {
  @override
  String call(double params) => '${(params / 2).toStringAsFixed(1)}/5';
}
