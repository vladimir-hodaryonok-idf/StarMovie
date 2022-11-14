import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';


@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
  MockSpec<PreferencesLocalRepository>(),
  MockSpec<UserEmailPass>(),
])
void main() {
  group('LoginUseCaseTest', () {
    final authRepository = MockAuthRepository();
    final preferences = MockPreferencesLocalRepository();
    final user = MockUserEmailPass();
    final LoginWithEmailAndPassUseCase loginWithEmailAndPassUseCase =
        LoginWithEmailAndPassUseCase(
      authRepository: authRepository,
      preferences: preferences,
    );
    test('SuccessTest', () async {
      when(authRepository.isLoginAndPasswordCorrect(user))
          .thenAnswer((_) async => true);
      await loginWithEmailAndPassUseCase(user);
      verify(preferences.saveLoggedUser(user)).called(1);
    });
    test('FailureTest', () async {
      when(authRepository.isLoginAndPasswordCorrect(user))
          .thenAnswer((_) async => false);
      expect(loginWithEmailAndPassUseCase(user),
          throwsA(isA<ValidationException>()));
      verifyNever(preferences.saveLoggedUser(any));
    });
  });
}
