abstract class InUseCase<In, R> {
  final R _repository;

  InUseCase(this._repository);

  R get repository => _repository;

  call(In params);
}
