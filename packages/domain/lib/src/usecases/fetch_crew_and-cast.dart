import 'package:domain/domain.dart';
import 'package:domain/src/models/people_model/crew_and_cast.dart';
import 'package:domain/src/request/trakt_api/trakt_api_peoples.dart';
import 'package:domain/src/usecases/base/in_out_use_case.dart';

class FetchCrewAndCastUseCase extends InOutUseCase<int, Future<CrewAndCast>> {
  final NetworkRepository networkRepository;

  FetchCrewAndCastUseCase({
    required this.networkRepository,
  });

  @override
  Future<CrewAndCast> call(int params) async {
    final request = TraktApiPeoples.castAndCrew(params);
    final ResponseModel response = await networkRepository.fetchData(request);
    return CrewAndCast.fromJson(response.data);
  }
}