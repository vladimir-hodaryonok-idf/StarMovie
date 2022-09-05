// ignore_for_file: depend_on_referenced_packages
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

void initDependencies() {
  initPresentationModule();
  initDomainDependencies();
  initDataDependencies();
}
