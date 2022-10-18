import 'package:domain/src/mappers/base_mapper.dart';

class IsApiRequestAllowedMapper implements Mapper<DateTime?, bool> {
  @override
  bool call(DateTime? date) {
    if (date != null) {
      final currentDate = DateTime.now();
      return currentDate.year == date.year &&
          currentDate.month == date.month &&
          currentDate.day == date.day;
    }
    return true;
  }
}
