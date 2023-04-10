import 'package:hospital/data/model/OnBoardingModel.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';

abstract class BaseLocalDataSource {
  List<OnBoardingModel> getOnBoarding();
}

class LocalDataSource extends BaseLocalDataSource {
  @override
  List<OnBoardingModel> getOnBoarding() {
    return [
      const OnBoardingModel(
          url: ImageAssets.onBoardingLogo1, title: AppStrings.onBoardingTitle1),
      const OnBoardingModel(
          url: ImageAssets.onBoardingLogo2, title: AppStrings.onBoardingTitle2),
      const OnBoardingModel(
          url: ImageAssets.onBoardingLogo3, title: AppStrings.onBoardingTitle3),
    ];
  }
}
