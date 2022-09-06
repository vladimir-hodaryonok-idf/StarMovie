class BaseTile<D> {
  final bool isLoading;
  final D? tile;

  BaseTile({
    required this.tile,
    required this.isLoading,
  });

  factory BaseTile.init() => BaseTile<D>(
        isLoading: false,
        tile: null,
      );

  BaseTile<D> copyWith({
    bool? isLoading,
    D? tile,
  }) =>
      BaseTile(
        isLoading: isLoading ?? this.isLoading,
        tile: tile ?? this.tile,
      );
}
