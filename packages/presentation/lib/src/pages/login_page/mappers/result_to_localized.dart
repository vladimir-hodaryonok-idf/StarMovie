import 'package:domain/domain.dart';
import 'package:presentation/generated/l10n.dart';

class ResultToLocalizedMapper
    implements Mapper<ValidationResult, ValidationResult> {
  @override
  ValidationResult call(ValidationResult result) => ValidationResult(
        login: _localize(result.login),
        password: _localize(result.password),
      );

  String? _localize(String? string) {
    if (string != null) {
      switch (string) {
        case ValidationAndLogin.loginIsRequired:
          return S.current.loginIsRequired;
        case ValidationAndLogin.invalidLoginFormat:
          return S.current.invalidLoginFormat;
        case ValidationAndLogin.passwordIsRequired:
          return S.current.passwordIsRequired;
        case ValidationAndLogin.invalidPassword:
          return S.current.invalidPassword;
      }
    }
    return null;
  }
}
