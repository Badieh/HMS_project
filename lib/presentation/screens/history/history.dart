import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/presentation/screens/history/diagnoses_tab.dart';
import 'package:hospital/presentation/screens/history/files_tab.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';
import 'package:hospital/presentation/screens/history/cubit/history_states.dart';
import 'package:hospital/presentation/screens/history/treatment_tab.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryCubit, HistoryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HistoryCubit cubit = HistoryCubit().get(context);

        return SafeArea(
          child: Scaffold(
            body: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: ColorManager.primary,
                    unselectedLabelColor: ColorManager.grey,
                    indicatorColor: ColorManager.primary,
                    physics: const BouncingScrollPhysics(),
                    tabs: const <Widget>[
                      Tab(
                        icon: FaIcon(
                          FontAwesomeIcons.notesMedical,
                          //color: ColorManager.primary,
                        ),
                        text: AppStrings.diagnosis,
                      ),
                      Tab(
                        icon: FaIcon(
                          FontAwesomeIcons.briefcaseMedical,
                          //color: ColorManager.primary,
                        ),
                        text: AppStrings.treatment,
                      ),
                      Tab(
                        icon: FaIcon(
                          FontAwesomeIcons.fileMedical,
                          //color: ColorManager.primary,
                        ),
                        text: AppStrings.files,
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      physics: const BouncingScrollPhysics(),
                      children: <Widget>[
                        DiagnosesTab(cubit: cubit),
                        TreatmentTab(cubit: cubit),
                        FilesTab(cubit: cubit),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // floatingActionButton: FloatingActionButton(
            //   isExtended: false,
            //   elevation: 2.0,
            //   hoverElevation: 6.0,
            //   focusElevation: 6.0,
            //   onPressed: () {
            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //       builder: (context) => PdfPreviewScreen(
            //     //         url: '',
            //     //       ),
            //     //     ));
            //   },
            //   child: const FaIcon(FontAwesomeIcons.fileArrowUp),
            //   // mini: false,
            // ),
          ),
        );
      },
    );
  }
}
