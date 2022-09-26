import 'package:domain/domain.dart';
import 'package:domain/src/mappers/cast_and_image_list_mapper.dart';
import 'package:domain/src/use_cases/base/in_out_use_case.dart';

class FetchCrewAndCastUseCase
    implements InOutUseCase<int, Future<List<PeopleWithImage>>> {
  final TraktApiNetworkRepository traktApiNetworkRepository;
  final TmdbApiNetworkRepository tmdbApiNetworkRepository;
  final CastAndImagesListMapper castAndImagesListMapper;

  const FetchCrewAndCastUseCase({
    required this.traktApiNetworkRepository,
    required this.tmdbApiNetworkRepository,
    required this.castAndImagesListMapper,
  });

  @override
  Future<List<PeopleWithImage>> call(int id) async {
    final CrewAndCast crewAndCast =
        await traktApiNetworkRepository.fetchCrewAndCast(id);
    final List<int?> idList = _createFirstFourIdsList(crewAndCast);
    final List<CastAndCrewImages> images = await _fetchImages(idList);

    return castAndImagesListMapper(
      crewAndCast.cast ?? [],
      images,
    );
  }

  Future<List<CastAndCrewImages>> _fetchImages(List<int?> idList) async =>
      Future.wait(
        idList.map(
          (id) async => id != null
              ? await tmdbApiNetworkRepository.fetchImage(id)
              : CastAndCrewImages(),
        ),
      );

  List<int?> _createFirstFourIdsList(CrewAndCast crewAndCast) {
    const firstFourIds = 4;
    final cast = crewAndCast.cast ?? List.empty();
    final length = cast.length >= firstFourIds ? firstFourIds : cast.length;
    return List.generate(length, (index) => cast[index].person?.ids?.tmdb)
        .toList();
  }
}
