import 'package:domain/domain.dart';
import 'package:domain/src/use_cases/base/in_out_use_case.dart';

class LoginWithEmailAndPassUseCase
    implements InOutUseCase<UserEmailPass, Future<bool>> {
  final AuthRepository authRepository;
  final PreferencesLocalRepository preferences;

  const LoginWithEmailAndPassUseCase({
    required this.authRepository,
    required this.preferences,
  });

  @override
  Future<bool> call(UserEmailPass user) async =>
      authRepository.isLoginAndPasswordCorrect(user);
}
