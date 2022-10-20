import 'package:domain/domain.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';

class LoginGoogleUseCase implements OutUseCase<Future<void>> {
  final AuthRepository authRepository;
  final PreferencesLocalRepository preferences;

  const LoginGoogleUseCase({
    required this.authRepository,
    required this.preferences,
  });

  @override
  Future<void> call() async {
    final UserEmailPass? user = await authRepository.loginWithGoogle();
    if (user != null) {
      final isAbleToLogin =
          await authRepository.isLoginAndPasswordCorrect(user);
      return isAbleToLogin == true
          ? null
          : throw ValidationException(ValidationResult.loginFailure());
    }
  }
}
