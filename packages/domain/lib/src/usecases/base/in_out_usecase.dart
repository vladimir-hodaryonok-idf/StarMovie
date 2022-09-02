abstract class InOutUseCase<In, Out, R> {
  final R _repository;

  InOutUseCase(this._repository);

  R get repository => _repository;

  Out call(In params);
}
