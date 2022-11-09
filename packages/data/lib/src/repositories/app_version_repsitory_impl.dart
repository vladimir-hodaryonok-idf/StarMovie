import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:package_info_plus/package_info_plus.dart';

const _versionCollection = 'StarMovie_versions';

class AppVersionRepositoryImpl implements AppVersionRepository {
  final FirebaseFirestore _firebaseFirestore;
  final PackageInfo _packageInfo;

  const AppVersionRepositoryImpl(
    this._firebaseFirestore,
    this._packageInfo,
  );

  @override
  Future<AppVersions> getVersions() async {
    final QuerySnapshot<Map<String, dynamic>> query =
        await _firebaseFirestore.collection(_versionCollection).get();
    final data = query.docs.first;
    return AppVersions(
      actualVersion: data['actual'],
      minVersion: data['minimal'],
      currentVersion: _packageInfo.version,
    );
  }
}
