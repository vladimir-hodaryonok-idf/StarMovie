import 'package:domain/domain.dart';
import 'package:presentation/src/navigation/base_arguments.dart';

class MovieArgs implements BaseArguments{
  final Movie _movie;
  const MovieArgs(this._movie);

  @override
  get value => _movie;
}