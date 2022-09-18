// ignore_for_file: depend_on_referenced_packages
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:star_movie/key_store_loader/key_store_loader.dart';

const keysPath = 'keys.json';

Future<void> initDependencies() async {
  initPresentationModule();
  initDomainDependencies(await keys());
  initDataDependencies();
}

Future<Map<String,dynamic>> keys() async{
  final keyStoreLoader = KeyStoreLoader(path: keysPath);
  return keyStoreLoader.load();
}
