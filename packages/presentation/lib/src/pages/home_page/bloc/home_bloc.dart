import 'package:presentation/src/base_bloc/bloc.dart';

abstract class HomeBloc extends Bloc {
  factory HomeBloc() => _HomeBloc();
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  _HomeBloc() : super(null);
}
