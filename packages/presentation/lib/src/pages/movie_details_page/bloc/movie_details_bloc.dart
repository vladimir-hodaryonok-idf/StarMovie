import 'package:domain/domain.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';

abstract class MovieDetailsBloc extends Bloc<BaseArguments, Movie?>{
  factory MovieDetailsBloc(

  ) => _MovieDetailsBloc();

  void goBack();
}

class _MovieDetailsBloc extends BlocImpl<BaseArguments, Movie?>
    implements MovieDetailsBloc{
  _MovieDetailsBloc(): super(null);

  @override
  void init() {
    super.init();
  }

  @override
  void goBack() {
    appNavigator.pop();
  }
@override
  void initArgs(BaseArguments args) {
    final Movie movie = args.value as Movie;
    emit(data: movie);
  }
}