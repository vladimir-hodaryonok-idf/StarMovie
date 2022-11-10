import 'package:domain/domain.dart';

class VersionToIntMapper implements Mapper<String, int> {
  @override
  int call(String version) {
    final String withoutDot = version.replaceAll('.', '');
    return int.tryParse(withoutDot) ?? -1;
  }
}
