import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';

class PatientTabsScreen extends StatelessWidget {
  const PatientTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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

              ],
            ),
          ),
        ],
      ),
    );;
  }
}
