import 'package:domain/domain.dart';
import 'package:domain/src/models/people_model/crew_and_cast.dart';
import 'package:domain/src/use_cases/base/in_out_use_case.dart';

class FetchCrewAndCastUseCase extends InOutUseCase<int, Future<CrewAndCast>> {
  final NetworkRepository networkRepository;

  FetchCrewAndCastUseCase({
    required this.networkRepository,
  });

  @override
  Future<CrewAndCast> call(int id) async {
    final ResponseModel response = await networkRepository.fetchCrewAndCast(id);
    return CrewAndCast.fromJson(response.data);
  }
}