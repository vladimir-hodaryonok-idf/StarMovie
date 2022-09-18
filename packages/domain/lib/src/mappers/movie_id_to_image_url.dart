import 'package:domain/src/key_store/store.dart';
import 'package:domain/src/mappers/base_mapper.dart';

const imageUrl = 'http://img.omdbapi.com/?apikey=';

class MovieIdToImageUrlMapper extends Mapper<String, String> {
  final ApiKeyStore apiKeyStore;

  MovieIdToImageUrlMapper({required this.apiKeyStore});

  @override
  String call(String id) => '$imageUrl${apiKeyStore.omdbApiKey}&i=$id';
}
