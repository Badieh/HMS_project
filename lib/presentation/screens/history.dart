import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';

import '../resources/color_manager.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
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
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        itemCount: 4,
                        itemBuilder: (context, index) => caseDiagnoseCard(
                            caseDiagnose: caseDiagnose1, context: context)),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        itemCount: 10,
                        itemBuilder: (context, index) => treatmentCard(
                            caseDiagnose: caseDiagnose1,
                            context: context,
                            treatment: treatment1)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
