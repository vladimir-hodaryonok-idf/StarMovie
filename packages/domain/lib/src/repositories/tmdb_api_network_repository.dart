import 'package:domain/src/models/cast_images/cast_and_crew_images.dart';

abstract class TmdbApiNetworkRepository{
  Future<CastAndCrewImages> fetchImage(int id);
}