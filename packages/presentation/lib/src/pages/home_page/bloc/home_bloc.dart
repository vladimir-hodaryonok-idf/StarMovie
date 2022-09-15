import 'package:domain/domain.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/base_bloc/movie_args.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/home_page/bloc/home_data.dart';
import 'package:presentation/src/pages/home_page/mappers/anticipated_to_home_list.dart';
import 'package:presentation/src/pages/home_page/mappers/trending_to_home_list.dart';
import 'package:presentation/src/pages/movie_details_page/movie_details.dart';

abstract class HomeBloc extends Bloc<BaseArguments, HomePageData> {
  factory HomeBloc(
    FetchTrendingMoviesUseCase fetchTrendingMovies,
    FetchAnticipatedMoviesUseCase fetchAnticipatedMovies,
    TrendingToHomeListMapper trendingToHomeList,
    AnticipatedToHomeListMapper anticipatedToHomeList,
  ) =>
      _HomeBloc(
        fetchTrendingMovies,
        fetchAnticipatedMovies,
        trendingToHomeList,
        anticipatedToHomeList,
      );

  void onButtonTap(MovieButtonStatus id);

  void onItemTap(int index);

  Future<void> refreshList({bool? isLoading = false});
}

class _HomeBloc extends BlocImpl<BaseArguments, HomePageData>
    implements HomeBloc {
  final FetchTrendingMoviesUseCase _fetchTrendingMovies;
  final FetchAnticipatedMoviesUseCase _anticipatedMovies;
  final TrendingToHomeListMapper _trendingToHomeList;
  final AnticipatedToHomeListMapper _anticipatedToHomeList;

  _HomeBloc(
    this._fetchTrendingMovies,
    this._anticipatedMovies,
    this._trendingToHomeList,
    this._anticipatedToHomeList,
  ) : super(HomePageData.init());

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
      final trendingFull = await _fetchTrendingMovies();
      final homeTrendingMovies = _trendingToHomeList(trendingFull);
      emit(
        data: tile.copyWith(
          trending: homeTrendingMovies,
          trendingFull: trendingFull,
        ),
        isLoading: false,
      );
    } on AppException catch (e) {
      emit(isLoading: false, exception: e);
    } catch (e) {
      emit(isLoading: false, exception: UnknownException("Unknown Error"));
    }
  }

  Future<void> _fetchAnticipated({bool? isLoading = true}) async {
    emit(data: tile, isLoading: isLoading);
    try {
      final anticipatedFull = await _anticipatedMovies();
      final homeAnticipatedMovies = _anticipatedToHomeList(anticipatedFull);
      emit(
        data: tile.copyWith(
          anticipated: homeAnticipatedMovies,
          anticipatedFull: anticipatedFull,
        ),
        isLoading: false,
      );
    } on AppException catch (e) {
      emit(isLoading: false, exception: e);
    } catch (e) {
      emit(isLoading: false, exception: UnknownException("Unknown Error"));
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
        ? tile.trendingFull[index].movie
        : tile.anticipatedFull[index].movie;
    final args = MovieArgs(movieFull);
    appNavigator.push(MovieDetailsPage.page(args));
  }
}
