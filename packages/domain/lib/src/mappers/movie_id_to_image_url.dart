import 'package:domain/src/mappers/base_mapper.dart';
import 'package:domain/src/json/yaml/properties.dart';

const imageUrl = 'http://img.omdbapi.com/?apikey=${ApiKeys.omdbApiKey}&i=';

class MovieIdToImageUrlMapper extends Mapper<String?, String> {
  @override
  String call(String? params) => '$imageUrl${params}';
}
