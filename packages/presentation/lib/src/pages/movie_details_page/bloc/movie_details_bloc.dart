import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/details_data.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/movie_to_movie_details.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/peoples_to_crew_ui_list.dart';
import 'package:share_text/share_text.dart';

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

  void share(BuildContext context);
}

class _MovieDetailsBloc extends BlocImpl<BaseArguments, DetailsData>
    implements MovieDetailsBloc {
  final FetchCrewAndCastUseCase fetchCrewAndCast;
  final MovieToMovieDetailsMapper _movieToDetails;
  final PeoplesToCrewUiMapper peoplesToCrewUiMapper;

  _MovieDetailsBloc(
    this.fetchCrewAndCast,
    this._movieToDetails,
    this.peoplesToCrewUiMapper,
  ) : super(DetailsData.init());

  void _initData(int id) async {
    try {
      final List<PeopleWithImage> peopleWithImage = await fetchCrewAndCast(id);
      emit(
        data: tile.copyWith(
          crewAndCast: peoplesToCrewUiMapper(peopleWithImage),
        ),
      );
    } on AppException catch (e) {
      print(e.message);
    }
  }

  @override
  void goBack() => appNavigator.pop();

  @override
  void share(BuildContext context) async {
    final id = tile.movieDetails?.id ?? 0;
    final locale = Localizations.localeOf(context).languageCode;
    final message = S.of(context).shareString(id, locale);
    ShareText.shareText(message);
  }

  @override
  void initArgs(BaseArguments args) {
    final Movie movie = args.value as Movie;
    final movieDetails = _movieToDetails(movie);
    emit(data: tile.copyWith(movieDetails: movieDetails));
    _initData(movieDetails.id);
  }
}
