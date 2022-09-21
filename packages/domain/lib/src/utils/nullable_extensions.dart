import 'package:collection/collection.dart';

extension EmptyStringIfNull on String? {
  String get stringOrEmpty => this ?? '';
}

extension GetFirstIOrDefaultValue on List<String>? {
  int get firstToInt {
    final value = this?.firstOrNull ?? '0';
    return int.parse(value);
  }

  String get firstOrEmpty => this?.firstOrNull ?? '';
}
