class HistoryStates {}

class HistoryInitialState extends HistoryStates {}

class GetDiagnosisListLoadingState extends HistoryStates {}

class GetDiagnosisListSuccessState extends HistoryStates {}

class GetDiagnosisListErrorState extends HistoryStates {
  final String error;

  GetDiagnosisListErrorState(this.error);
}

class GetTreatmentListLoadingState extends HistoryStates {}

class GetTreatmentListSuccessState extends HistoryStates {}

class GetTreatmentListErrorState extends HistoryStates {
  final String error;

  GetTreatmentListErrorState(this.error);
}

class GetFilesListLoadingState extends HistoryStates {}

class GetFilesListSuccessState extends HistoryStates {}

class GetFilesListErrorState extends HistoryStates {
  final String error;

  GetFilesListErrorState(this.error);
}

class UploadFileLoadingState extends HistoryStates {}

class UploadFileSuccessState extends HistoryStates {}

class UploadFileErrorState extends HistoryStates {
  final String error;

  UploadFileErrorState(this.error);
}

class PickFileLoadingState extends HistoryStates {}

class PickFileSuccessState extends HistoryStates {}

class PickFileErrorState extends HistoryStates {
  final String error;

  PickFileErrorState(this.error);
}

// class GetCaseDiagnoseLoadingState extends HistoryStates {}
//
// class GetCaseDiagnoseSuccessState extends HistoryStates {}
//
// class GetCaseDiagnoseErrorState extends HistoryStates {
//   final String error;
//
//   GetCaseDiagnoseErrorState(this.error);
// }
