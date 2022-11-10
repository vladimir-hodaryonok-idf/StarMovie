import 'package:domain/src/mappers/version_to_int_mapper.dart';
import 'package:domain/src/models/version_check_result/version_check_result.dart';
import 'package:domain/src/repositories/app_info_repository.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CheckAppVersionUseCase implements OutUseCase<Future<VersionCheckResult>> {
  final AppInfoRepository appVersionRepository;
  final VersionToIntMapper versionToIntMapper;
  final PackageInfo packageInfo;

  const CheckAppVersionUseCase(
    this.appVersionRepository,
    this.versionToIntMapper,
    this.packageInfo,
  );

  @override
  Future<VersionCheckResult> call() async {
    final versions = await appVersionRepository.getVersions();
    final actualVersion = versionToIntMapper(versions.actualVersion);
    final minVersion = versionToIntMapper(versions.minVersion);
    final currentVersion = versionToIntMapper(packageInfo.version);
    if (currentVersion < minVersion) {
      return VersionCheckResult.shouldUpdate;
    }
    if (currentVersion < actualVersion && currentVersion >= minVersion) {
      return VersionCheckResult.ableToUpdate;
    }
    return VersionCheckResult.actualVersion;
  }
}
