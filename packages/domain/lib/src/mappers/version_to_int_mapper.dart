import 'package:domain/domain.dart';

class VersionToIntMapper implements Mapper<String, int> {
  @override
  int call(String version) {
    final String withoutDot = version.split('.').join();
    return int.tryParse(withoutDot) ?? -1;
  }
}
