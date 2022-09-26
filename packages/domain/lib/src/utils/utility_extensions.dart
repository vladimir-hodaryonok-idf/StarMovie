extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension RatingToStringMapper on double{
  String toStringRating() => '${(this / 2).toStringAsFixed(1)}/5';
}

extension TakePercents on double {
  double get fiftyFivePercent => this * 0.55;
  double get thirtyPercent => this * 0.30;
}
