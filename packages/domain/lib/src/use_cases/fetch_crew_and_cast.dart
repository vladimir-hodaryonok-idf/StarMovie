import 'package:domain/domain.dart';
import 'package:domain/src/mappers/cast_and_crew_to_list_mapper.dart';
import 'package:domain/src/mappers/cast_and_image_list_mapper.dart';
import 'package:domain/src/models/data_wrapper/cast_and_images_wrapper.dart';
import 'package:domain/src/models/people_model/cast_and_crew_member.dart';
import 'package:domain/src/use_cases/base/in_out_use_case.dart';

class FetchCrewAndCastUseCase
    implements InOutUseCase<int, Future<List<PeopleWithImage>>> {
  final TraktApiNetworkRepository traktApiNetworkRepository;
  final TmdbApiNetworkRepository tmdbApiNetworkRepository;
  final PeopleLocalRepository peopleLocalRepository;
  final CastAndImagesMapper castAndImagesMapper;
  final CastAndCrewToListMapper castAndCrewToListMapper;

  const FetchCrewAndCastUseCase({
    required this.traktApiNetworkRepository,
    required this.tmdbApiNetworkRepository,
    required this.castAndImagesMapper,
    required this.peopleLocalRepository,
    required this.castAndCrewToListMapper,
  });

  @override
  Future<List<PeopleWithImage>> call(int id) async {
    final fromCache = await peopleLocalRepository.fetchByMovieId(id);
    if (fromCache.isNotEmpty) {
      return fromCache;
    }
    return _fetchFromApiAndCache(id);
  }

  Future<List<PeopleWithImage>> _fetchFromApiAndCache(int id) async {
    final fullMemberList = await _fetchCastAndCrewMember(id);
    final fromApi = await _fetchImagesAndMap(fullMemberList);
    await peopleLocalRepository.saveCast(fromApi, id);
    return fromApi;
  }

  Future<List<CastAndCrewMember>> _fetchCastAndCrewMember(int id) async {
    final team = await traktApiNetworkRepository.fetchCrewAndCast(id);
    final crewAndCastMembersList = castAndCrewToListMapper(team);
    return crewAndCastMembersList.isEmpty
        ? List.empty()
        : crewAndCastMembersList;
  }

  Future<List<PeopleWithImage>> _fetchImagesAndMap(
    List<CastAndCrewMember> members,
  ) async {
    return Future.wait(
      members.map(
        (member) async {
          final id = member.person?.ids?.tmdb;
          if (id == null) return PeopleWithImage();
          final images = await tmdbApiNetworkRepository.fetchImage(id);
          return castAndImagesMapper(
            CastAndImageWrapper(
              images: images,
              people: member,
            ),
          );
        },
      ),
    );
  }
}
