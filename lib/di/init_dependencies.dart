import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

void initDependencies() {
  initPresentationModule();
  initDomainDependencies();
  initDataDependencies();
}
