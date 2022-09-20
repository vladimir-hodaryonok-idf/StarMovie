import 'package:domain/src/mappers/base_mapper.dart';

const imageUrl = 'http://img.omdbapi.com/?apikey=';

class MovieIdToImageUrlMapper extends Mapper<String, String> {
  final String apiKey;

  MovieIdToImageUrlMapper({required this.apiKey});

  @override
  String call(String id) => imageUrl + apiKey + '&i=' + id;
}
