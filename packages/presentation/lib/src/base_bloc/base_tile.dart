class BaseTile<D> {
  final bool isLoading;
  final String? errorMessage;
  final D? tile;

  BaseTile({
    required this.tile,
    required this.isLoading,
    required this.errorMessage,
  });

  factory BaseTile.init() => BaseTile<D>(
        isLoading: true,
        tile: null,
        errorMessage: null,
      );

  BaseTile<D> copyWith({
    bool? isLoading,
    D? tile,
    String? errorMessage,
  }) =>
      BaseTile(
        isLoading: isLoading ?? this.isLoading,
        tile: tile ?? this.tile,
        errorMessage: errorMessage,
      );
}
