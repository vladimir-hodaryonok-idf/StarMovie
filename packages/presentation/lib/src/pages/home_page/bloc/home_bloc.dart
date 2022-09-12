import 'package:domain/domain.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/base_bloc/movie_args.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/src/pages/home_page/model/home_page_movie.dart';
import 'package:presentation/src/pages/movie_details_page/movie_details.dart';

abstract class HomeBloc extends Bloc<BaseArguments, HomePageData> {
  factory HomeBloc(
    FetchTrendingMoviesUseCase fetchTrendingMovies,
    FetchAnticipatedMoviesUseCase fetchAnticipatedMovies,
  ) =>
      _HomeBloc(fetchTrendingMovies, fetchAnticipatedMovies);

  void onButtonTap(MovieButtonStatus id);

  void onItemTap(int index);

  Future<void> refreshList({bool? isLoading = false});
}

class _HomeBloc extends BlocImpl<BaseArguments, HomePageData>
    implements HomeBloc {
  final FetchTrendingMoviesUseCase _fetchTrendingMovies;
  final FetchAnticipatedMoviesUseCase _anticipatedMovies;

  _HomeBloc(
    this._fetchTrendingMovies,
    this._anticipatedMovies,
  ) : super(HomePageData.init());

  final List<MovieTrending> _trendingFull = [];
  final List<MovieAnticipated> _anticipatedFull = [];

  @override
  void init() async {
    super.init();
    _fetchTrending();
  }

  @override
  void onButtonTap(MovieButtonStatus id) {
    if (id == MovieButtonStatus.trending)
      _onTrendingClick();
    else if (id == MovieButtonStatus.anticipated) _onAnticipatedClick();
  }

  void _onAnticipatedClick() {
    emit(data: tile.copyWith(buttonStatus: MovieButtonStatus.anticipated));
    tile.anticipated.isEmpty ? _fetchAnticipated() : emit(data: tile);
  }

  void _onTrendingClick() {
    emit(data: tile.copyWith(buttonStatus: MovieButtonStatus.trending));
    tile.trending.isEmpty ? _fetchTrending() : emit(data: tile);
  }

  Future<void> _fetchTrending({bool? isLoading = true}) async {
    emit(data: tile, isLoading: isLoading);
    try {
      _trendingFull.clear();
      _trendingFull.addAll(await _fetchTrendingMovies());
      final homeTrendingMovies = _trendingFull
          .map(
            (e) => HomePageMovie.fromDomainMovie(e.movie),
          )
          .toList();
      emit(
        data: tile.copyWith(trending: homeTrendingMovies),
        isLoading: false,
      );
    } on AppException catch (e) {
      emit(isLoading: false, errorMessage: e.details);
    } catch (e) {
      emit(isLoading: false, errorMessage: 'Unknown Error');
    }
  }

  Future<void> _fetchAnticipated({bool? isLoading = true}) async {
    emit(data: tile, isLoading: isLoading);
    try {
      _anticipatedFull.clear();
      _anticipatedFull.addAll(await _anticipatedMovies());
      final homeAnticipatedMovies = _anticipatedFull
          .map(
            (e) => HomePageMovie.fromDomainMovie(e.movie),
          )
          .toList();
      emit(
        data: tile.copyWith(anticipated: homeAnticipatedMovies),
        isLoading: false,
      );
    } on AppException catch (e) {
      emit(isLoading: false, errorMessage: e.details);
    } catch (e) {
      emit(isLoading: false, errorMessage: 'Unknown Error');
    }
  }

  @override
  Future<void> refreshList({bool? isLoading = false}) async {
    return tile.buttonStatus == MovieButtonStatus.trending
        ? _fetchTrending(isLoading: isLoading)
        : _fetchAnticipated(isLoading: isLoading);
  }

  @override
  void onItemTap(int index) {
    final Movie movieFull = tile.buttonStatus == MovieButtonStatus.trending
        ? _trendingFull[index].movie
        : _anticipatedFull[index].movie;
    final args = MovieArgs(movieFull);
    appNavigator.push(MovieDetails.page(args));
  }
}
