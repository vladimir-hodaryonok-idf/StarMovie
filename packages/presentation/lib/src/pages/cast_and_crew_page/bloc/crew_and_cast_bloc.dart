import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/cast_and_crew_page/bloc/crew_and_cast_data.dart';
import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';

abstract class CrewAndCastBloc extends Bloc<BaseArguments, CrewAndCastData> {
  factory CrewAndCastBloc() => _CrewAndCastBloc();

  void onBackPressed();
}

class _CrewAndCastBloc extends BlocImpl<BaseArguments, CrewAndCastData>
    implements CrewAndCastBloc {
  _CrewAndCastBloc() : super(CrewAndCastData.init());

  @override
  void onBackPressed() => appNavigator.pop();

  @override
  void initArgs(BaseArguments args) {
    final crew = args.value as List<CrewAndCastUi>;
    emit(data: tile.copyWith(crew: crew));
  }
}
