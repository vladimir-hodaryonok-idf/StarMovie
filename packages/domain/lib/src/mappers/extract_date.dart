import 'dart:io';

import 'package:domain/domain.dart';

class ExtractDateMapper implements Mapper<Map<String, List<String>>, DateTime?> {
  @override
  DateTime? call(Map<String, List<String>> params) {
    final date = params['date'].firstOrEmpty;
    if (date.isNotEmpty) {
      return HttpDate.parse(date);
    }
    return null;
  }
}
