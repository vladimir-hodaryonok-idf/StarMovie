import 'package:domain/domain.dart';

class ListToGenresStringMapper extends Mapper<List<String>, String> {
  @override
  String call(List<String> list) => list.map((e) => e.capitalize()).join(', ');
}
