class AuthStates {}

class AuthInitialState extends AuthStates {}

class ChangePasswordAppearanceState extends AuthStates {}

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

class ChangeJobState extends AuthStates {}

class ChangeJobCountryState extends AuthStates {}

class ChangeJobCityState extends AuthStates {}

class ChangeJobStateState extends AuthStates {}

class ChangeJobBuildingState extends AuthStates {}

class ChangeJobStreetState extends AuthStates {}

class ChangePage extends AuthStates {}

class ChangeUserTypeState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessfulState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessfulState extends AuthStates {}

class RegisterErrorState extends AuthStates {
  final String error;

  RegisterErrorState(this.error);
}

class GetPatientLoadingState extends AuthStates {}

class GetPatientSuccessfulState extends AuthStates {}

class GetPatientErrorState extends AuthStates {
  final String error;

  GetPatientErrorState(this.error);
}

class CreatePatientLoadingState extends AuthStates {}

class CreatePatientSuccessfulState extends AuthStates {}

class CreatePatientErrorState extends AuthStates {
  final String error;

  CreatePatientErrorState(this.error);
}

class UpdatePatientLoadingState extends AuthStates {}

class UpdatePatientSuccessfulState extends AuthStates {}

class UpdatePatientErrorState extends AuthStates {
  final String error;

  UpdatePatientErrorState(this.error);
}
