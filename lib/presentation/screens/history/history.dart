import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';
import 'package:hospital/presentation/screens/history/cubit/history_states.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryCubit, HistoryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HistoryCubit cubit = HistoryCubit().get(context);
        return SafeArea(
          child: Scaffold(
            body: DefaultTabController(
              length: 2,
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
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      physics: const BouncingScrollPhysics(),
                      children: <Widget>[
                        ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p4),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            itemCount: cubit.caseDiagnosisList.length,
                            itemBuilder: (context, index) => caseDiagnoseCard(
                                caseDiagnose: cubit.caseDiagnosisList[index],
                                context: context)),
                        ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p4),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            itemCount: cubit.treatmentList.length,
                            itemBuilder: (context, index) => treatmentCard(
                                context: context,
                                treatment: cubit.treatmentList[index])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
