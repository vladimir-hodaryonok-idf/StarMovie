import 'package:domain/domain.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';

class LoginFaceBookUseCase implements OutUseCase<Future<bool>> {
  final AuthRepository authRepository;
  final PreferencesLocalRepository preferences;

  const LoginFaceBookUseCase({
    required this.authRepository,
    required this.preferences,
  });

  @override
  Future<bool> call() async {
    final UserEmailPass? user = await authRepository.loginWithFaceBook();
    return user != null
        ? await authRepository.isLoginAndPasswordCorrect(user)
        : false;
  }
}
