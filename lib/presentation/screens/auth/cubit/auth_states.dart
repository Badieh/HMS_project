class AuthStates {}

class AuthInitialState extends AuthStates {}

class ChangeFirstNameState extends AuthStates {}

class ChangeSecondNameState extends AuthStates {}

class ChangeThirdNameState extends AuthStates {}

class ChangeLastNameState extends AuthStates {}

class ChangeNationalIdState extends AuthStates {}

class ChangePhoneState extends AuthStates {}

class ChangeDateState extends AuthStates {}

class ChangeBloodTypeState extends AuthStates {}

class ChangeReligionState extends AuthStates {}

class ChangeGenderState extends AuthStates {}

class ChangeMaritalStatusState extends AuthStates {}

class ChangeHeightState extends AuthStates {}

class ChangeWeightState extends AuthStates {}

class ChangeNationalityState extends AuthStates {}

class ChangeAppartmentNumber extends AuthStates {}

class ChangeBuildingNumber extends AuthStates {}

class ChangeStreetName extends AuthStates {}

class ChangeAddressCountryState extends AuthStates {}

class ChangeAddressCityState extends AuthStates {}

class ChangeAddressStateState extends AuthStates {}

class ChangeBirthCountryState extends AuthStates {}

class ChangeBirthCityState extends AuthStates {}

class ChangeBirthStateState extends AuthStates {}

class ChangeJobCountryState extends AuthStates {}

class ChangeJobCityState extends AuthStates {}

class ChangeJobStateState extends AuthStates {}

class ChangePage extends AuthStates {}

class SubmitLoadingState extends AuthStates {}

class SubmitSuccefulState extends AuthStates {}

class SubmitErrorState extends AuthStates {
  final String error;

  SubmitErrorState(this.error);
}

class LoginLoadingState extends AuthStates {}

class LoginSuccesfulState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccesfulState extends AuthStates {}

class RegisterErrorState extends AuthStates {
  final String error;

  RegisterErrorState(this.error);
}
