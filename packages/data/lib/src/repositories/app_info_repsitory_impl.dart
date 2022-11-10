import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/src/remote/service/firebase_firerstore_service.dart';
import 'package:domain/domain.dart';

class AppVersionRepositoryImpl implements AppVersionRepository {
  final FireStoreService _firebaseFirestore;

  const AppInfoRepositoryImpl(
    this._firebaseFirestore,
  );

  @override
  Future<AppVersions> getVersions() async {
    final data = await _firebaseFirestore.fetchVersionsFromCloud();
    return AppVersions(
      actualVersion: data['actual'],
      minVersion: data['minimal'],
    );
  }
}
