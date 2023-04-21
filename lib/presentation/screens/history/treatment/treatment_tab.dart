import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';
import 'package:hospital/presentation/screens/history/treatment/treatment_card.dart';

class TreatmentTab extends StatelessWidget {
  const TreatmentTab({Key? key, required this.cubit}) : super(key: key);
  final HistoryCubit cubit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        itemCount: cubit.treatmentList.length,
        itemBuilder: (context, index) =>
            TreatmentCard(treatment: cubit.treatmentList[index]));
  }
}
