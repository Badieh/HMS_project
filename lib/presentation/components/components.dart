import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/articleModel.dart';
import 'package:hospital/models/caseDiagnoseModel.dart';
import 'package:hospital/models/treatmentModel.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/articles/webview.dart';

Widget DefaultTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String label,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
  required FormFieldValidator<String>? validator,
  required ValueChanged<String>? onFieldSubmitted,
  GestureTapCallback? onTap,
  bool isPassword = false,
  TextInputAction? TextInputAction,
  bool readOnly = false,
  bool enabled = true,
}) =>
    TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                size: 25,
              ),
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(
                icon: Icon(suffixIcon),
                onPressed: suffixPressed,
              ),
      ),
      obscureText: isPassword,
      onTapOutside: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: onTap,
      readOnly: readOnly,
      enabled: enabled,
    );

Widget favouriteDoctorCard(
        {required BuildContext context,
        IconData icon = Icons.favorite_border}) =>
    Container(
      padding: EdgeInsets.only(left: AppSizeHeight.s8, right: AppSizeHeight.s8),
      width: double.infinity,
      height: AppSizeHeight.s120,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSizeHeight.s25)),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: AppSizeHeight.s100,
            width: AppSizeWidth.s100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizeHeight.s25)),
            child: Image.asset(
              "assets/images/doc1.jpg",
              fit: BoxFit.cover,
            ),
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
                      "Dr.Badieh ElMasry",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Icon(
                      icon,
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
                height: AppSizeHeight.s8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Specialist",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Hospital Name",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizeHeight.s12,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rate_outlined,
                      size: AppSizeHeight.s17,
                    ),
                    Text(
                      " 4.8",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      " (4.258 reviews)",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );

Widget appointmentDoctorCard(
        {required BuildContext context,
        required AppointmentState appointmentState}) =>
    Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      height: AppSizeHeight.s100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p18),
        color: ColorManager.veryLightGrey,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.3),
        //     spreadRadius: 1,
        //     blurRadius: 10,
        //     offset: Offset(0, 3),
        //   )
        // ],
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppPadding.p18),
              color: ColorManager.grey,
            ),
            width: AppSizeWidth.s90,
            height: AppSizeHeight.s100,
            child: Image.asset(
              "assets/images/doc1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 45,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr.Badieh ElMasry",
                          style: TextStyle(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: AppSizeHeight.s4,
                        ),
                        Container(
                            width: AppSizeWidth.s98,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: getAppointmentStateColor(
                                      appointmentState)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  getAppointmentStateIcon(appointmentState),
                                  size: AppSizeHeight.s16,
                                  color: getAppointmentStateColor(
                                      appointmentState),
                                ),
                                Text(
                                  getAppointmentState(appointmentState),
                                  style: TextStyle(
                                      fontSize: FontSize.s14,
                                      fontWeight: FontWeight.w600,
                                      color: getAppointmentStateColor(
                                          appointmentState)),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: AppSizeHeight.s20,
                    backgroundColor: ColorManager.secondary,
                    child: IconButton(
                      onPressed: () {},
                      tooltip: AppStrings.notes,
                      splashColor: ColorManager.darkGrey,
                      splashRadius: AppSizeHeight.s25,
                      icon: Icon(Icons.note_add_rounded),
                      iconSize: AppSizeHeight.s25,
                      color: ColorManager.primary,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Specialist",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Hospital Name",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Time",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );

enum AppointmentState { upcoming, completed, cancelled }

String getAppointmentState(AppointmentState appointmentState) {
  switch (appointmentState) {
    case AppointmentState.upcoming:
      return AppStrings.upcoming;
    case AppointmentState.completed:
      return AppStrings.completed;
    case AppointmentState.cancelled:
      return AppStrings.cancelled;
  }
}

Color getAppointmentStateColor(AppointmentState appointmentState) {
  switch (appointmentState) {
    case AppointmentState.upcoming:
      return ColorManager.primary;
    case AppointmentState.completed:
      return ColorManager.green;
    case AppointmentState.cancelled:
      return ColorManager.error;
  }
}

IconData getAppointmentStateIcon(AppointmentState appointmentState) {
  switch (appointmentState) {
    case AppointmentState.upcoming:
      return Icons.next_plan;
    case AppointmentState.completed:
      return Icons.check_circle_rounded;
    case AppointmentState.cancelled:
      return Icons.cancel;
  }
}

Widget buildArticleCard(
        {required double height,
        required double width,
        required ArticleModel article,
        required context}) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewExample(url: article.url),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: width * 0.2,
                height: height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: article.urlToImage != null
                            ? NetworkImage(
                                '${article.urlToImage}',
                              )
                            : const AssetImage(
                                ImageAssets.imageNotFound,
                              ) as ImageProvider,
                        onError: (exception, stackTrace) {
                          // Display a fallback image or an error message
                          return;
                        },
                        fit: BoxFit.cover))),
            SizedBox(
              width: width * 0.07,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsetsDirectional.only(end: AppPadding.p8),
                height: height * 0.11,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(article.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Text(
                        article.publishedAt,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.03,
                            color: Colors.grey),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildListOfArticles(
        {required double height,
        required double width,
        required List<ArticleModel> articles,
        isSearch = false}) =>
    ConditionalBuilder(
        condition: articles.isNotEmpty,
        builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticleCard(
                height: height,
                width: width,
                article: articles[index],
                context: context),
            separatorBuilder: (context, index) => separator(),
            itemCount: 10),
        fallback: (context) => isSearch
            ? Container(
                child: Center(
                    child: Text(
                  'Developed by Badieh Nader',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
              )
            : Center(child: CircularProgressIndicator()));

Widget separator() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );

Widget caseDiagnoseCard({
  required BuildContext context,
  required CaseDiagnose caseDiagnose,
}) {
  DateTime dateTime = DateTime.parse(caseDiagnose.dateTime);
  return Container(
    margin: const EdgeInsets.all(AppMargin.m10),
    padding: const EdgeInsets.all(AppPadding.p10),
    height: AppSizeHeight.s100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppPadding.p18),
      color: ColorManager.veryLightGrey,
    ),
    child: Row(
      children: [
        // Department photo
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppPadding.p18),
            //color: ColorManager.grey,
          ),
          width: AppSizeWidth.s90,
          height: AppSizeHeight.s100,
          child: Image.network(
            caseDiagnose.departmentIconUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset(ImageAssets.imageNotFound),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 45,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Department Name
              Center(
                child: Text(
                  caseDiagnose.department,
                  style: TextStyle(
                    fontSize: FontSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Doctor Name
              Text(
                caseDiagnose.doctor,
                style: TextStyle(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              //Date and time
              Text(
                'Date: ${dateTime.year}/${dateTime.month}/${dateTime.second}',
                style: TextStyle(
                  fontSize: FontSize.s14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Time: ${dateTime.hour}:${dateTime.minute}:${dateTime.second}',
                style: TextStyle(
                  fontSize: FontSize.s14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget treatmentCard({
  required BuildContext context,
  required CaseDiagnose caseDiagnose,
  required Treatment treatment,
}) {
  //DateTime dateTime = DateTime.parse(caseDiagnose.dateTime);
  return Container(
    margin: const EdgeInsets.all(AppMargin.m10),
    padding: const EdgeInsets.all(AppPadding.p10),
    height: AppSizeHeight.s100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppPadding.p18),
      color: ColorManager.veryLightGrey,
    ),
    child: Row(
      children: [
        // Department photo
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppPadding.p18),
            //color: ColorManager.grey,
          ),
          width: AppSizeWidth.s90,
          height: AppSizeHeight.s100,
          child: Image.network(
            caseDiagnose.departmentIconUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset(ImageAssets.imageNotFound),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 45,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Treatment Name
              Row(
                children: [
                  Text(
                    AppStrings.treatment,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 45,
                  ),
                  Text(
                    treatment.treatmentName,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      //fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              // Doctor Name
              Row(
                children: [
                  Text(
                    AppStrings.doctorName_,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 45,
                  ),
                  Text(
                    treatment.treatmentName,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      //fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              // Start Date
              Row(
                children: [
                  Text(
                    AppStrings.treatment,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 45,
                  ),
                  Text(
                    treatment.treatmentName,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      //fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              // End Date
              Row(
                children: [
                  Text(
                    AppStrings.treatment,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 45,
                  ),
                  Text(
                    treatment.treatmentName,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      //fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    ),
  );
}
