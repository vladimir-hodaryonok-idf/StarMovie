import 'package:domain/domain.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';

class LoginGoogleUseCase implements OutUseCase<Future<bool>> {
  final AuthRepository authRepository;
  final PreferencesLocalRepository preferences;

  const LoginGoogleUseCase({
    required this.authRepository,
    required this.preferences,
  });

  @override
  Future<bool> call() async {
    final UserEmailPass? user = await authRepository.loginWithGoogle();
    return user != null
        ? await authRepository.isLoginAndPasswordCorrect(user)
        : false;
  }
}
