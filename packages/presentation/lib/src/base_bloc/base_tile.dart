class BaseTile<T> {
  final bool isLoading;
  final T? tile;

  BaseTile({
    required this.tile,
    required this.isLoading,
  });

  factory BaseTile.init() => BaseTile(
        isLoading: false,
        tile: null,
      );

  BaseTile<T> copyWith({
    bool? isLoading,
    T? tile,
  }) =>
      BaseTile(
        isLoading: isLoading ?? this.isLoading,
        tile: tile ?? this.tile,
      );
}
