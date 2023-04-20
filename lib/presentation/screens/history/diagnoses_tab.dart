import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

import '../../components/components.dart';
import 'cubit/history_cubit.dart';

class DiagnosesTab extends StatelessWidget {
  const DiagnosesTab({Key? key, required this.cubit}) : super(key: key);
  final HistoryCubit cubit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        itemCount: cubit.caseDiagnosisList.length,
        itemBuilder: (context, index) => caseDiagnoseCard(
            caseDiagnose: cubit.caseDiagnosisList[index], context: context));
  }
}
