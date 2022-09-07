import 'package:domain/src/usecases/base/out_use_case.dart';

class InitialApiCallUseCase extends OutUseCase {
  @override
  Future<void> call() => Future.delayed(Duration(seconds: 3));
}
