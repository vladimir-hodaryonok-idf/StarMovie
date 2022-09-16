import 'package:domain/domain.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/movie_to_movie_details.dart';
import 'package:presentation/src/pages/movie_details_page/model/movie_details.dart';

abstract class MovieDetailsBloc extends Bloc<BaseArguments, DetailsData> {
  factory MovieDetailsBloc(
    FetchCrewAndCastUseCase fetchCrewAndCast,
    MovieToMovieDetailsMapper movieToDetails,
  ) =>
      _MovieDetailsBloc(
        fetchCrewAndCast,
        movieToDetails,
      );

  void goBack();
}

class _MovieDetailsBloc extends BlocImpl<BaseArguments, DetailsData>
    implements MovieDetailsBloc {
  _MovieDetailsBloc(
    this.fetchCrewAndCast,
    this._movieToDetails,
  ) : super(DetailsData.init());
  final FetchCrewAndCastUseCase fetchCrewAndCast;
  final MovieToMovieDetailsMapper _movieToDetails;

  @override
  void init() async {
    super.init();
  }

  void initData(MovieDetails details) async {
    final crewAndCast = await fetchCrewAndCast(details.id);
    print(crewAndCast.cast);

    //todo map and emit
    emit(
      data: tile.copyWith(movieDetails: details),
    );
  }

  @override
  void goBack() => appNavigator.pop();

  @override
  void initArgs(BaseArguments args) {
    final Movie movie = args.value as Movie;
    final movieDetails = _movieToDetails(movie);
    initData(movieDetails);
  }
}
