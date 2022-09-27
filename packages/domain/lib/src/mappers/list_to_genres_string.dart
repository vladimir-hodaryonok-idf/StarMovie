import 'package:domain/domain.dart';

class ListToGenresStringMapper extends Mapper<List<String>, String> {
  @override
  String call(List<String> list) {
    final buffer = '';
    list.forEach((element) {
      if (list.indexOf(element) != list.length - 1)
        buffer + '${element.capitalize()}, ';
      else
        buffer + element.capitalize();
    });
    return buffer;
  }
}
