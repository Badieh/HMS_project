import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/models/file_model.dart';
import 'package:hospital/models/treatment_model.dart';
import 'package:hospital/network/remote/dio_helper.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/screens/history/cubit/history_states.dart';
import 'package:hospital/presentation/screens/pdf_printing.dart';

class HistoryCubit extends Cubit<HistoryStates> {
  HistoryCubit() : super(HistoryInitialState());

  HistoryCubit get(context) => BlocProvider.of(context);

  List<CaseDiagnose> caseDiagnosisList = [];

  Future<void> getDiagnosisList() async {
    emit(GetDiagnosisListLoadingState());

    try {
      var response =
          await DioHelper.getData(url: AppConstants.articlesPath, query: {
        'country': AppConstants.country,
        'category': AppConstants.category,
        'apiKey': AppConstants.articlesApiKey,
      });
      //print(response.data['articles'][1]);
      // caseDiagnosisList = List.from(response.data['articles'])
      //     .map((e) => CaseDiagnose.fromJson(e))
      //     .toList();
      // print(articles[1]);

      // dummy data to be removed when api is ready
      caseDiagnosisList = [
        caseDiagnose1,
        caseDiagnose1,
        caseDiagnose1,
        caseDiagnose1
      ];
      emit(GetDiagnosisListSuccessState());
    } catch (error) {
      print(error.toString());
      emit(GetDiagnosisListErrorState(error.toString()));
    }
  }

  List<Treatment> treatmentList = [];
  Future<void> getTreatmentList() async {
    emit(GetTreatmentListLoadingState());

    try {
      var response =
          await DioHelper.getData(url: AppConstants.articlesPath, query: {
        'country': AppConstants.country,
        'category': AppConstants.category,
        'apiKey': AppConstants.articlesApiKey,
      });
      //print(response.data['articles'][1]);
      // caseDiagnosisList = List.from(response.data['articles'])
      //     .map((e) => CaseDiagnose.fromJson(e))
      //     .toList();
      // print(articles[1]);

      // dummy data to be removed when api is ready
      treatmentList = [
        treatment1,
        treatment1,
        treatment1,
        treatment1,
      ];
      emit(GetTreatmentListSuccessState());
    } catch (error) {
      print(error.toString());
      emit(GetTreatmentListErrorState(error.toString()));
    }
  }

  List<FileModel> filesList = [];
  Future<void> getFilesList() async {
    emit(GetFilesListLoadingState());

    try {
      var response =
          await DioHelper.getData(url: AppConstants.articlesPath, query: {
        'country': AppConstants.country,
        'category': AppConstants.category,
        'apiKey': AppConstants.articlesApiKey,
      });
      //print(response.data['articles'][1]);
      // caseDiagnosisList = List.from(response.data['articles'])
      //     .map((e) => CaseDiagnose.fromJson(e))
      //     .toList();
      // print(articles[1]);

      // dummy data to be removed when api is ready
      filesList = [
        file1,
        file1,
        file1,
        file1,
        file1,
        file1,
      ];
      emit(GetFilesListSuccessState());
    } catch (error) {
      print(error.toString());
      emit(GetFilesListErrorState(error.toString()));
    }
  }

  Future<void> pickFile() async {
    emit(PickFileLoadingState());

    try {
      emit(GetFilesListSuccessState());
    } catch (error) {
      print(error.toString());
      emit(GetFilesListErrorState(error.toString()));
    }
  }

  Future<void> scanImage(context) async {
    try {
      final imagesPathsList = await CunningDocumentScanner.getPictures();

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfPrintingScreen(
                title: 'aloha', imagePathsList: imagesPathsList),
          ));
      //await generatePdf(title: '', imagePathsList: imagesPathsList);
    } catch (error) {
      print('error scaning images : ${error.toString()}');
    }
  }

  Future<void> uploadFile() async {
    await pickFile();
    emit(UploadFileLoadingState());
    try {
      //   var response =
      //   await DioHelper.postData(url: AppConstants.articlesPath, query: {
      //     'country': AppConstants.country,
      //     'category': AppConstants.category,
      //     'apiKey': AppConstants.articlesApiKey,
      //   }, data: null);
      //print(response.data['articles'][1]);
      // caseDiagnosisList = List.from(response.data['articles'])
      //     .map((e) => CaseDiagnose.fromJson(e))
      //     .toList();
      // print(articles[1]);

      emit(UploadFileSuccessState());
    } catch (error) {
      print(error.toString());
      emit(UploadFileErrorState(error.toString()));
    }
  }
// Future<void> getCaseDiagnose(CaseDiagnose caseDiagnose) async {
  //   emit(GetCaseDiagnoseLoadingState());
  //
  //   try {
  //     var response =
  //         await DioHelper.getData(url: AppConstants.articlesPath, query: {
  //       'country': AppConstants.country,
  //       'category': AppConstants.category,
  //       'apiKey': AppConstants.articlesApiKey,
  //     });
  //     //print(response.data['articles'][1]);
  //     // caseDiagnosisList = List.from(response.data['articles'])
  //     //     .map((e) => CaseDiagnose.fromJson(e))
  //     //     .toList();
  //     // print(articles[1]);
  //
  //     // dummy data to be removed when api is ready
  //     caseDiagnosisList = [
  //       caseDiagnose1,
  //       caseDiagnose1,
  //       caseDiagnose1,
  //       caseDiagnose1
  //     ];
  //     emit(GetCaseDiagnoseSuccessState());
  //   } catch (error) {
  //     print(error.toString());
  //     emit(GetCaseDiagnoseErrorState(error.toString()));
  //   }
  // }
  //
  // Future<void> _createPDF() async {
  //   //Create a new PDF document
  //   PdfDocument document = PdfDocument();
  //
  //   //Add a new page and draw text
  //   document.pages.add().graphics.drawString(
  //       'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 20),
  //       brush: PdfSolidBrush(PdfColor(0, 0, 0)),
  //       bounds: Rect.fromLTWH(0, 0, 500, 50));
  //
  //   //Save the document
  //   List<int> bytes = await document.save();
  //
  //   //Dispose the document
  //   document.dispose();
  // }
}
