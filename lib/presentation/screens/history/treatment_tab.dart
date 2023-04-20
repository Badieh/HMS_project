import 'package:flutter/material.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';

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
        itemBuilder: (context, index) => treatmentCard(
            context: context, treatment: cubit.treatmentList[index]));
  }
}
