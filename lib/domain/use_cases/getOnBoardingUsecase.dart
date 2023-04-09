import 'package:hospital/domain/entities/onboarding_entity.dart';
import 'package:hospital/domain/repository/base_repository.dart';

class GetOnBoardingUsecase {
  final BaseRepository _baseRepository;

  GetOnBoardingUsecase(this._baseRepository);

  List<OnBoardingEntity> call() {
    return _baseRepository.getOnBoarding();
  }
}
