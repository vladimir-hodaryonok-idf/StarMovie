import 'package:data/src/database/dao/date_dao.dart';
import 'package:data/src/database/dto/date_dto.dart';
import 'package:domain/domain.dart';

const _trendingKey = 0;
const _anticipatedKey = 1;

class DateRepositoryImpl implements DateRepository {
  final DateDao dateDao;

  const DateRepositoryImpl({required this.dateDao});

  @override
  Future<DateTime?> getAnticipatedLastUpdateDate() async{
    final date = await dateDao.getDateByKey(_anticipatedKey);
    return date?.toDateTime();
  }

  @override
  Future<DateTime?> getTrendingLastRequestDate() async {
    final date = await dateDao.getDateByKey(_trendingKey);
    return date?.toDateTime();
  }

  @override
  Future<void> saveAnticipatedLastUpdateFromApiDate(DateTime date) {
    final toDatabase = DateDto(date.millisecondsSinceEpoch, _anticipatedKey);
    return dateDao.saveAnticipatedDate(toDatabase);
  }

  @override
  Future<void> saveTrendingLastUpdateFromApiDate(DateTime date) {
    final toDatabase = DateDto(date.millisecondsSinceEpoch, _trendingKey);
    return dateDao.saveTrendingDate(toDatabase);
  }
}
