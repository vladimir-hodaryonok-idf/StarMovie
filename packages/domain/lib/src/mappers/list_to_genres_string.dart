import 'package:domain/domain.dart';

class ListToGenresString extends Mapper<List<String>, String> {
  @override
  String call(List<String> list) {
    final buffer = StringBuffer();
    list.forEach((element) {
      if (list.indexOf(element) != list.length - 1)
        buffer.write('${element.capitalize()}, ');
      else
        buffer.write(element.capitalize());
    });
    return buffer.toString();
  }
}
