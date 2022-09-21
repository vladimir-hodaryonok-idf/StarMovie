import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

Future<void> initDependencies() async {
  initPresentationModule();
  initDomainDependencies();
  await initDataDependencies();
}
