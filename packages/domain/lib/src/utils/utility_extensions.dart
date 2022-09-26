extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension RatingToStringMapper on double{
  String toStringRating() => '${(this / 2).toStringAsFixed(1)}/5';
}
