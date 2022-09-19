import 'package:domain/domain.dart';

abstract class TmdbApiNetworkRepository{
  Future<ListResponseModel> fetchImage(int id);
}