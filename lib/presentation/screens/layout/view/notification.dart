import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:readmore/readmore.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_outlined),
            color: ColorManager.black,
          ),
          title: Text(AppStrings.notificationScreenTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: FontSize.s20)),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                child: Card(
                  child: ListTile(
                    iconColor: ColorManager.primary,
                    leading: Icon(Icons.notification_important),
                    title: Text('Notification Title'),
                    subtitle: ReadMoreText(
                      AppStrings.loremIpson,
                      textAlign: TextAlign.justify,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: AppStrings.viewmore,
                      trimExpandedText: AppStrings.viewless,
                      trimLines: 2,
                      lessStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primary),
                      moreStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primary),
                      style: TextStyle(
                          fontSize: FontSize.s15,
                          height: AppSizeHeight.s1_5,
                          color: ColorManager.darkGrey),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Action to perform when the user taps the card
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              );
            },
            itemCount: 3)

    );
  }
}
