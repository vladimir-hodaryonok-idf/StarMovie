import 'package:floor/floor.dart';

class ListToStringConverter extends TypeConverter<List<String>?, String> {
  @override
  List<String>? decode(String databaseValue) =>
      databaseValue.isEmpty ? null : databaseValue.split(',');

  @override
  String encode(List<String>? value) => value != null ? value.join(',') : '';
}
