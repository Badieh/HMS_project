class ProfileDataStates {}

class ProfileDtateInitialState extends ProfileDataStates {}

class ChangeFirstNameState extends ProfileDataStates {}

class ChangeSecondNameState extends ProfileDataStates {}

class ChangeThirdNameState extends ProfileDataStates {}

class ChangeLastNameState extends ProfileDataStates {}

class ChangeNationalIdState extends ProfileDataStates {}

class ChangePhoneState extends ProfileDataStates {}

class ChangeDateState extends ProfileDataStates {}

class ChangeBloodTypeState extends ProfileDataStates {}

class ChangeReligionState extends ProfileDataStates {}

class ChangeGenderState extends ProfileDataStates {}

class ChangeMaritalStatusState extends ProfileDataStates {}

class ChangeHeightState extends ProfileDataStates {}

class ChangeWeightState extends ProfileDataStates {}

class ChangeNationalityState extends ProfileDataStates {}

class ChangeAppartmentNumber extends ProfileDataStates {}

class ChangeBuildingNumber extends ProfileDataStates {}

class ChangeStreetName extends ProfileDataStates {}

class ChangeAddressCountryState extends ProfileDataStates {}

class ChangeAddressCityState extends ProfileDataStates {}

class ChangeAddressStateState extends ProfileDataStates {}

class ChangeBirthCountryState extends ProfileDataStates {}

class ChangeBirthCityState extends ProfileDataStates {}

class ChangeBirthStateState extends ProfileDataStates {}

class ChangeJobCountryState extends ProfileDataStates {}

class ChangeJobCityState extends ProfileDataStates {}

class ChangeJobStateState extends ProfileDataStates {}

class ChangePage extends ProfileDataStates {}

class SubmitLoadingState extends ProfileDataStates {}

class SubmitSuccefulState extends ProfileDataStates {}

class SubmitErrorState extends ProfileDataStates {
  final String error;

  SubmitErrorState(this.error);
}
