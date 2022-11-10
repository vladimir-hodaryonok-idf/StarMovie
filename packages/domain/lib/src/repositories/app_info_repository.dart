import 'package:domain/src/models/app_versions/app_versions.dart';

abstract class AppInfoRepository{
  Future<AppVersions> getVersions();
}