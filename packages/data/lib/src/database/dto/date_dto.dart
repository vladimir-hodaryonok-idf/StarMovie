import 'package:floor/floor.dart';

@entity
class DateDto {
  @primaryKey
  final int key;
  final int? date;

  const DateDto(this.date, this.key);

  DateTime? toDateTime() =>
      date != null ? DateTime.fromMillisecondsSinceEpoch(date!) : null;
}
