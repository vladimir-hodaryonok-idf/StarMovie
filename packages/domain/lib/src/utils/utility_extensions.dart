import 'package:domain/domain.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension TakePercents on double {
  double get fiftyFivePercent => this * 0.55;

  double get thirtyPercent => this * 0.30;

  double get fiftyPercents => this / 2;
}

extension NullAbleString on String? {
  String get valueOrEmpty => this ?? '';
}

extension IsValid on ValidationResult {
  bool get isFailure => this.login != null || this.password != null;
}

extension IsApiRequestAllowed on DateTime? {
  bool get isApiRequestAllowed {
    if (this != null) {
      final currentDate = DateTime.now();
      return currentDate.year != this!.year &&
          currentDate.month != this!.month &&
          currentDate.day != this!.day;
    }
    return true;
  }
}
