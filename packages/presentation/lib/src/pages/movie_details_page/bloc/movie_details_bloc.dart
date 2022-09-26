import 'package:domain/domain.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/movie_to_movie_details.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/peoples_to_crew_ui_list.dart';

abstract class MovieDetailsBloc extends Bloc<BaseArguments, DetailsData> {
  factory MovieDetailsBloc(
    FetchCrewAndCastUseCase fetchCrewAndCast,
    MovieToMovieDetailsMapper movieToDetails,
    PeoplesToCrewUiMapper peoplesToCrewUiMapper,
  ) =>
      _MovieDetailsBloc(
        fetchCrewAndCast,
        movieToDetails,
        peoplesToCrewUiMapper,
      );

  void goBack();
}

class _MovieDetailsBloc extends BlocImpl<BaseArguments, DetailsData>
    implements MovieDetailsBloc {
  _MovieDetailsBloc(
    this.fetchCrewAndCast,
    this._movieToDetails,
    this.peoplesToCrewUiMapper,
  ) : super(DetailsData.init());
  final FetchCrewAndCastUseCase fetchCrewAndCast;
  final MovieToMovieDetailsMapper _movieToDetails;
  final PeoplesToCrewUiMapper peoplesToCrewUiMapper;

  @override
  void init() {
    super.init();
  }

  void initData(int id) async {
    try {
      final List<PeopleWithImage> peopleWithImage = await fetchCrewAndCast(id);
      emit(
        data: tile.copyWith(
          crewAndCast: peoplesToCrewUiMapper(peopleWithImage),
        ),
      );
    } on AppException catch (e) {}
  }

  @override
  void goBack() => appNavigator.pop();

  @override
  void initArgs(BaseArguments args) {
    final Movie movie = args.value as Movie;
    final movieDetails = _movieToDetails(movie);
    emit(data: tile.copyWith(movieDetails: movieDetails));
    initData(movieDetails.id);
  }
}
