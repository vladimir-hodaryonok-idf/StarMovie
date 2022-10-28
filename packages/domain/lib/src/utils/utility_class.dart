import 'package:domain/src/models/data_wrapper/movies_wrapper.dart';

class MoviesUtility {
  static ListCompareResult<T>? findItemsToAddAndDelete<T>(MoviesWrapper<T> data) {
    final diffs = data.apiList.toSet().difference(data.dbList.toSet());
    if (diffs.isNotEmpty) {
      return ListCompareResult<T>(
        itemsToDelete:
            diffs.where((element) => !data.apiList.contains(element)).toList(),
        itemsToAdd:
            diffs.where((element) => !data.dbList.contains(element)).toList(),
      );
    }
    return null;
  }
}


