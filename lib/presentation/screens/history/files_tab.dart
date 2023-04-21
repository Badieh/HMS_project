import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';

class FilesTab extends StatelessWidget {
  const FilesTab({Key? key, required this.cubit}) : super(key: key);
  final HistoryCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p10, vertical: AppPadding.p10),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              itemCount: cubit.filesList.length,
              itemBuilder: (context, index) =>
                  fileCard(fileModel: cubit.filesList[index], context: context),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: AppSizeWidth.s10,
                mainAxisSpacing: AppSizeHeight.s10,
                mainAxisExtent: AppSizeHeight.s95,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              isExtended: false,
              elevation: 2.0,
              hoverElevation: 6.0,
              focusElevation: 6.0,
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    surfaceTintColor: ColorManager.veryLightGrey,
                    title: const Text(AppStrings.chooseAction),
                    actions: [
                      // scan
                      GestureDetector(
                        onTap: () async {
                          await cubit.scanImage(context);
                        },
                        child: Column(children: [
                          CircleAvatar(
                            radius: AppSizeHeight.s30,
                            backgroundColor: ColorManager.lightPrimary,
                            child: Icon(
                              Icons.camera_alt,
                              color: ColorManager.primary,
                              size: AppSizeHeight.s30,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 99,
                          ),
                          Text(
                            AppStrings.scanImage,
                            style: TextStyle(
                              fontSize: FontSize.s18,
                              //fontWeight: FontWeightManager.bold
                            ),
                          )
                        ]),
                      ),
                      // files
                      GestureDetector(
                        onTap: () async {
                          await cubit.pickFile(context);

                        },
                        child: Column(children: [
                          CircleAvatar(
                            radius: AppSizeHeight.s30,
                            backgroundColor: ColorManager.lightPrimary,
                            child: Icon(
                              Icons.file_copy,
                              color: ColorManager.primary,
                              size: AppSizeHeight.s30,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 99,
                          ),
                          Text(
                            AppStrings.files,
                            style: TextStyle(
                              fontSize: FontSize.s18,
                              //fontWeight: FontWeightManager.bold
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                );

                //await cubit.scanImage(context);

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => PdfPreviewScreen(
                //         url: '',
                //       ),
                //     ));
              },
              child: FaIcon(
                FontAwesomeIcons.fileArrowUp,
                color: ColorManager.white,
              ),
              // mini: false,
            ),
          ),
        ],
      ),
    );
  }
}
