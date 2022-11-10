import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

const _versionCollection = 'StarMovie_versions';

class AppInfoRepositoryImpl implements AppInfoRepository {
  final FirebaseFirestore _firebaseFirestore;

  const AppInfoRepositoryImpl(
    this._firebaseFirestore,
  );

  @override
  Future<AppVersions> getVersions() async {
    final QuerySnapshot<Map<String, dynamic>> query =
        await _firebaseFirestore.collection(_versionCollection).get();
    final data = query.docs.first;
    return AppVersions(
      actualVersion: data['actual'],
      minVersion: data['minimal'],
    );
  }
}
