abstract class OutUseCase<Out, R> {
  final R _repository;

  OutUseCase(this._repository);

  R get repository => _repository;

  Out call();
}
