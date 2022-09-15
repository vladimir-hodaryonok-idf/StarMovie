import 'package:domain/src/mappers/base_mapper.dart';

class DurationToStringMapper extends Mapper<int?, String> {
  @override
  String call(int? params) {
    if (params == null) return '';
    final int hours = params ~/ 60;
    final minutes = params - hours * 60;
    if (hours == 0) return ' ${minutes}m';
    return ' ${hours}h ${minutes}m';
  }
}
