import 'package:domain/domain.dart';
import 'package:domain/src/models/people_model/crew_and_cast.dart';
import 'package:domain/src/use_cases/base/in_out_use_case.dart';

class FetchCrewAndCastUseCase extends InOutUseCase<int, Future<CrewAndCast>> {
  final TraktApiNetworkRepository traktApiNetworkRepository;
  final TmdbApiNetworkRepository tmdbApiNetworkRepository;

//todo makeMappers

  FetchCrewAndCastUseCase({
    required this.traktApiNetworkRepository,
    required this.tmdbApiNetworkRepository,
  });

  @override
  Future<CrewAndCast> call(int id) async {
    final ListResponseModel response =
        await traktApiNetworkRepository.fetchCrewAndCast(id);
    final crewAndCast = CrewAndCast.fromJson(response.data);
    final idList = _createIdList(crewAndCast);
    final responsesList = await _fetchImages(idList);

    return CrewAndCast.fromJson(response.data);
  }

  Future<List<ListResponseModel>> _fetchImages(List<int> idList) async {
    final List<ListResponseModel> responsesList = [];
    await Future.forEach<int>(
      idList,
      (element) async => responsesList.add(
        await tmdbApiNetworkRepository.fetchImage(element),
      ),
    );
    return responsesList;
  }

  List<int> _createIdList(CrewAndCast crewAndCast) {
    final cast = crewAndCast.cast ?? List.empty();
    final length = cast.length;
    return List.generate(length, (index) => cast[index].person?.ids?.tmdb ?? 0)
        .toList();
  }
}
