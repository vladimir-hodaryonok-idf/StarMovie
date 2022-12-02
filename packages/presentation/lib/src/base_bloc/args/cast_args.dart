import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';

class CastAndCrewArgs implements BaseArguments {
  final List<CrewAndCastUi> _crew;

  const CastAndCrewArgs(this._crew);

  @override
  List<CrewAndCastUi> get value => _crew;
}
