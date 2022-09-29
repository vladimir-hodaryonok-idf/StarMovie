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
