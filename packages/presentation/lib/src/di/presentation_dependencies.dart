import 'package:presentation/src/di/ui_layer_mappers_module.dart';
import 'package:presentation/src/di/navigator_module.dart';
import 'package:needle_di/needle_di.dart';
import 'package:presentation/src/di/bloc_module.dart';

final inject = Needle.instance;

void initPresentationModule() {
  initNavigatorModule();
  initUiLayerMappers();
  initBlocModule();
}
