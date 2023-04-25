import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class Search_Screen extends StatelessWidget {
  Search_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isEmpty = true;
    TextEditingController _searchBarController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
        ),
        body: Container(
          padding: EdgeInsets.only(left: AppSizeWidth.s10,right: AppSizeWidth.s10,top: AppSizeWidth.s10),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.007,),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * .15,
                  child:
                  DefaultTextFormField(
                    textAlign: TextAlign.left,
                    autoFocus: true,
                      controller: _searchBarController,
                      keyboardType: TextInputType.text,
                      label: 'Search',

                      enabled: true,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      prefixIcon: Icons.search,

                      onFieldSubmitted: (String value) {}),
                ),
                isEmpty ? Container(
                    width: double.infinity,
                    height: AppSizeHeight.s540,
                    child: doctorList()) : doctorList(),
              ],
            ),
          ),
        ));
  }
}

Widget doctorList() {
  return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding:
              EdgeInsets.only(left: AppSizeHeight.s8, right: AppSizeHeight.s8),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSizeHeight.s25)),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.height * 0.17,
                child: Image.network(ImageAssets.doctorPlaceHolder),
                decoration: BoxDecoration(
                    color: ColorManager.grey2,
                    borderRadius: BorderRadius.circular(AppSizeHeight.s25)),
              ),
              SizedBox(
                width: AppSizeWidth.s4,
              ),
              Column(
                children: [
                  SizedBox(
                    height: AppSizeHeight.s18,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.docName,
                          style: TextStyle(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: ColorManager.primary,
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Divider(
                        color: ColorManager.grey2,
                      )),
                  SizedBox(
                    height: AppSizeHeight.s2,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            AppStrings.docSpeciality,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        SizedBox(
                          child: Text(
                            AppStrings.hospitalName_,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSizeHeight.s4,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.24,
                          child: AutoSizeText(
                            AppStrings.docdegree,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                          child: AutoSizeText(
                            "|",
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.24,
                          child: AutoSizeText(
                            AppStrings.docposition,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
            color: ColorManager.grey2,
            height: 5,
            indent: AppSizeWidth.s20,
            endIndent: AppSizeWidth.s20,
            thickness: 1.5,
          ),
      itemCount: 5);
}
