import 'package:domain/domain.dart';
import 'package:domain/src/mappers/cast_and_image_list_mapper.dart';
import 'package:domain/src/models/people_with_image/people_with_image.dart';
import 'package:domain/src/use_cases/base/in_out_use_case.dart';

const firstFourIds = 4;

class FetchCrewAndCastUseCase
    extends InOutUseCase<int, Future<List<PeopleWithImage>>> {
  final TraktApiNetworkRepository traktApiNetworkRepository;
  final TmdbApiNetworkRepository tmdbApiNetworkRepository;
  final CastAndImagesListMapper castAndImagesListMapper;

  FetchCrewAndCastUseCase({
    required this.traktApiNetworkRepository,
    required this.tmdbApiNetworkRepository,
    required this.castAndImagesListMapper,
  });

  @override
  Future<List<PeopleWithImage>> call(int id) async {
    final CrewAndCast crewAndCast =
        await traktApiNetworkRepository.fetchCrewAndCast(id);
    final List<int> idList = _createFirstFourIdsList(crewAndCast);
    final List<CastAndCrewImages> images = await _fetchImages(idList);

    return castAndImagesListMapper(
      crewAndCast.cast ?? [],
      images,
    );
  }

  Future<List<CastAndCrewImages>> _fetchImages(List<int> idList) async {
    final List<CastAndCrewImages> responsesList = [];
    await Future.forEach<int>(
      idList,
      (element) async => responsesList.add(
        await tmdbApiNetworkRepository.fetchImage(element),
      ),
    );
    return responsesList;
  }

  List<int> _createFirstFourIdsList(CrewAndCast crewAndCast) {
    final cast = crewAndCast.cast ?? List.empty();
    final length = cast.length >= firstFourIds ? firstFourIds : cast.length;
    return List.generate(length, (index) => cast[index].person?.ids?.tmdb ?? 0)
        .toList();
  }
}
