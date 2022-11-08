import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/src/remote/service/firebase_firerstore_service.dart';
import 'package:domain/domain.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionRepositoryImpl implements AppVersionRepository {
  final FireStoreService firebaseFirestore;
  final PackageInfo packageInfo;

  const AppVersionRepositoryImpl(
    this.firebaseFirestore,
    this.packageInfo,
  );

  @override
  Future<AppVersions> getVersions() async {
    final data = await firebaseFirestore.fetchVersionsFromCloud();
    return AppVersions(
      actualVersion: data['actual'],
      minVersion: data['minimal'],
      currentVersion: packageInfo.version,
    );
  }
}
