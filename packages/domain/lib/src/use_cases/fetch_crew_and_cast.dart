import 'package:domain/domain.dart';
import 'package:domain/src/mappers/cast_and_image_list_mapper.dart';
import 'package:domain/src/models/data_wrapper/cast_and_images_wrapper.dart';
import 'package:domain/src/use_cases/base/in_out_use_case.dart';

class FetchCrewAndCastUseCase
    implements InOutUseCase<int, Future<List<PeopleWithImage>>> {
  final TraktApiNetworkRepository traktApiNetworkRepository;
  final TmdbApiNetworkRepository tmdbApiNetworkRepository;
  final CastAndImagesMapper castAndImagesMapper;

  const FetchCrewAndCastUseCase({
    required this.traktApiNetworkRepository,
    required this.tmdbApiNetworkRepository,
    required this.castAndImagesMapper,
  });

  @override
  Future<List<PeopleWithImage>> call(int id) async {
    final List<Cast> cast =
        await traktApiNetworkRepository.fetchCrewAndCast(id);
    if (cast.isEmpty) return List.empty();
    return _fetchImagesAndMap(cast);
  }

  Future<List<PeopleWithImage>> _fetchImagesAndMap(List<Cast> cast) async {
    final List<int> indexes = _generateFirstIndexes(cast.length);
    return Future.wait(
      indexes.map(
        (index) async {
          final id = cast[index].person?.ids?.tmdb;
          if (id == null) return PeopleWithImage();
          final images = await tmdbApiNetworkRepository.fetchImage(id);
          return castAndImagesMapper(
            CastAndImageWrapper(
              images: images,
              people: cast[index],
            ),
          );
        },
      ),
    );
  }

  List<int> _generateFirstIndexes(int castLength) {
    const firstFourIds = 4;
    final length = castLength >= firstFourIds ? firstFourIds : castLength;
    return List.generate(length, (index) => index++);
  }
}
