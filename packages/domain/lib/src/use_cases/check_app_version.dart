import 'package:domain/src/mappers/version_to_int_mapper.dart';
import 'package:domain/src/models/version_check_result/version_check_result.dart';
import 'package:domain/src/repositories/app_version_repository.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';

class CheckAppVersionUseCase implements OutUseCase<Future<VersionCheckResult>> {
  final AppVersionRepository appVersionRepository;
  final VersionToIntMapper versionToIntMapper;

  const CheckAppVersionUseCase(
    this.appVersionRepository,
    this.versionToIntMapper,
  );

  @override
  Future<VersionCheckResult> call() async {
    final versions = await appVersionRepository.getVersions();
    final actualVersion = versionToIntMapper(versions.actualVersion);
    final minVersion = versionToIntMapper(versions.minVersion);
    final currentVersion = versionToIntMapper(versions.currentVersion);
    if (currentVersion < minVersion) {
      return VersionCheckResult.shouldUpdate;
    }
    if (currentVersion < actualVersion && currentVersion >= minVersion) {
      return VersionCheckResult.ableToUpdate;
    }
    return VersionCheckResult.actualVersion;
  }
}
