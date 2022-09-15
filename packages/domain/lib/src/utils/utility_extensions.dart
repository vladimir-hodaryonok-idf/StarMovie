extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension ListOfStringsToString on List<String>? {
  String get strings {
    if (this == null || this!.isEmpty) return '';
    final buffer = StringBuffer();
    this?.forEach((element) {
      if (this?.indexOf(element) != this!.length - 1)
        buffer.write('${element.capitalize()}, ');
      else
        buffer.write(element.capitalize());
    });
    return buffer.toString();
  }
}

extension IntToTime on int? {
  String get toTimeString {
    if (this == null) return '';
    final hours = this! ~/ 60;
    final minutes = this! - hours * 60;
    if (hours >= 1)
      return '${hours}h ${minutes}m';
    else
      return '${minutes}m';
  }
}

extension RatingMaping on double? {
  int get fiveStarsRating => this == null ? 0 : (this! / 2).round();

  String get stringCompareWithFive {
    final value = this == null ? 0 : (this! / 2).toStringAsFixed(1);
    return '${value}/5';
  }
}
