import 'package:domain/src/mappers/base_mapper.dart';
import 'package:domain/src/use_cases/constants/usecase_constants.dart';
import 'package:domain/src/utils/nullable_extensions.dart';

const minimumPagesCount = 5;
const defaultItemsPerPage = 10;

class ExtractItemLimit extends Mapper<Map<String, List<String>>, int> {
  @override
  int call(Map<String, List<String>> params) {
    final pagesCount = params[HeaderKey.pages].firstToInt;
    final itemsCount = params[HeaderKey.items].firstToInt;
    if (pagesCount >= minimumPagesCount)
      return minimumPagesCount * defaultItemsPerPage;
    else
      return itemsCount;
  }
}
