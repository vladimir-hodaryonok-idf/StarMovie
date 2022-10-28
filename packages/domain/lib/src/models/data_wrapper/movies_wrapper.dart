class MoviesWrapper<T> {
  final List<T> apiList;
  final List<T> dbList;

  const MoviesWrapper({
    required this.dbList,
    required this.apiList,
  });
}

class ListCompareResult<T> {
  final List<T> itemsToDelete;
  final List<T> itemsToAdd;

  const ListCompareResult({
    required this.itemsToDelete,
    required this.itemsToAdd,
  });
}