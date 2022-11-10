import 'package:domain/domain.dart';
import 'package:domain/src/use_cases/base/in_use_case.dart';

class LoginWithEmailAndPassUseCase implements InUseCase<UserEmailPass> {
  final AuthRepository authRepository;
  final PreferencesLocalRepository preferences;

  const LoginWithEmailAndPassUseCase({
    required this.authRepository,
    required this.preferences,
  });

  @override
  Future<void> call(UserEmailPass user) async =>
      await authRepository.isLoginAndPasswordCorrect(user) == true
          ? preferences.saveLoggedUser(user)
          : throw ValidationException(ValidationResult.loginFailure());
}
