extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension IntToTimeString on int?{
  String get timeFormat {
    if(this == null) return '';
    final int hours = this! ~/60;
    final minutes = this! - hours * 60;
    return ' ${hours}h ${minutes}m';
  }
}