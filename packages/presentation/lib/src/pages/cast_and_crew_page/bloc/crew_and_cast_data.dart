import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';

class CrewAndCastData {
  final List<CrewAndCastUi> crew;

  const CrewAndCastData(this.crew);

  factory CrewAndCastData.init() => CrewAndCastData(List.empty());

  CrewAndCastData copyWith({List<CrewAndCastUi>? crew}) =>
      CrewAndCastData(crew ?? this.crew);
}
