import 'package:domain/domain.dart';

class BaseTile<D> {
  final bool isLoading;
  final AppException? exception;
  final D? tile;

  const BaseTile({
    required this.tile,
    required this.isLoading,
    required this.exception,
  });

  factory BaseTile.init() => BaseTile<D>(
        isLoading: false,
        tile: null,
        exception: null,
      );

  BaseTile<D> copyWith({
    bool? isLoading,
    D? tile,
    AppException? exception,
  }) =>
      BaseTile(
        isLoading: isLoading ?? this.isLoading,
        tile: tile ?? this.tile,
        exception: exception,
      );
}
