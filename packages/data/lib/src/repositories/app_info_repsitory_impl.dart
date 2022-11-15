import 'package:data/src/constants/strings.dart';
import 'package:data/src/remote/service/firebase_firerstore_service.dart';
import 'package:domain/domain.dart';


class AppInfoRepositoryImpl implements AppInfoRepository {
  final FireStoreService _firebaseFirestore;

  const AppInfoRepositoryImpl(
    this._firebaseFirestore,
  );

  @override
  Future<AppVersions> getVersions() async {

    final data = await _firebaseFirestore.fetchVersionsFromCloud();
    return AppVersions(
      actualVersion: data[DataStrings.actual],
      minVersion: data[DataStrings.minimal],
    );
  }
}
