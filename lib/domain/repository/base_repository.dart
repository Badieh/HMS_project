import 'package:hospital/domain/entities/onboarding_entity.dart';

abstract class BaseRepository {
  List<OnBoardingEntity> getOnBoarding();
}
