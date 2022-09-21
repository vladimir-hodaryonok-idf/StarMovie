import 'package:domain/src/use_cases/base/out_use_case.dart';

class InitialApiCallUseCase extends OutUseCase {
  @override
  Future<void> call() => Future.delayed(Duration(seconds: 3));
}
