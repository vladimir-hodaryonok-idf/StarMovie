import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:package_info_plus/package_info_plus.dart';

const _versionCollection = 'StarMovie_versions';

class AppVersionRepositoryImpl implements AppVersionRepository {
  final FirebaseFirestore firebaseFirestore;
  final PackageInfo packageInfo;

  const AppVersionRepositoryImpl(
    this.firebaseFirestore,
    this.packageInfo,
  );

  @override
  Future<AppVersions> getVersions() async {
    final QuerySnapshot<Map<String, dynamic>> query =
        await firebaseFirestore.collection(_versionCollection).get();
    final data = query.docs.first;
    return AppVersions(
      actualVersion: data['actual'],
      minVersion: data['minimal'],
      currentVersion: packageInfo.version,
    );
  }
}
