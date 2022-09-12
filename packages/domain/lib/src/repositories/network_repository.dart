import 'package:domain/domain.dart';

abstract class NetworkRepository {
  Future<ResponseModel> fetchData(APIRequestRepresentable request);
}
