import 'package:domain/src/di/use_case_module.dart';
import 'package:needle_di/needle_di.dart';
import 'package:domain/src/di/mappers_module.dart';

final inject = Needle.instance;

void initDomainDependencies() {
  initMappers();
  initUseCases();
}
