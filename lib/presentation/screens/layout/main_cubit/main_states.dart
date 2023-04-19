abstract class MainStates {}

class MainInitialState extends MainStates {}

class GetMainLoadingState extends MainStates {}

class ChangeMainScreenIndex extends MainStates {}

class GetMainSuccessState extends MainStates {}

class GetMainErrorState extends MainStates {
  final String error;

  GetMainErrorState(this.error);
}
