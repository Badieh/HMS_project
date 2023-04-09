import 'package:hospital/data/data_source/local_data_source.dart';
import 'package:hospital/domain/entities/onboarding_entity.dart';
import 'package:hospital/domain/repository/base_repository.dart';

class Repository extends BaseRepository {
  final LocalDataSource _localDataSource;

  Repository(this._localDataSource);

  @override
  List<OnBoardingEntity> getOnBoarding() {
    return _localDataSource.getOnBoarding();
  }
}
