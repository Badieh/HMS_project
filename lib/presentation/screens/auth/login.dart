import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:hospital/presentation/screens/auth/cubit/auth_states.dart';
import 'package:quickalert/quickalert.dart';

import '../routes/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);

        if (state is LoginSuccessfulState) {
          print(AppConstants.adminStorage.read('patientId'));
          if (AppConstants.adminStorage.read('patientId') == null) {
            Get.toNamed(Routes.fillProfile);
            snackbar(message: cubit.loginUserModel!.message, isSuccess: true);
          } else {
            AppConstants.adminStorage.write('isLogged', true);

            Get.offAllNamed(Routes.homeLayoutScreen);
          }
        } else if (state is LoginErrorState) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: cubit.errorModel!.message,
              backgroundColor:
                  Get.isDarkMode ? ColorManager.lightBlack : ColorManager.white,
              titleColor:
                  Get.isDarkMode ? ColorManager.white : ColorManager.black,
              textColor:
                  Get.isDarkMode ? ColorManager.white : ColorManager.black,
              confirmBtnColor:
                  Get.isDarkMode ? ColorManager.white : ColorManager.primary,
              confirmBtnTextStyle: TextStyle(
                color: Get.isDarkMode ? ColorManager.black : ColorManager.white,
              ));
        }
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          ImageAssets.hands3,
                          width: AppSizeWidth.s200,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Text(AppStrings.logInToYourAccount,
                          style: Theme.of(context).textTheme.headlineLarge),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),

                      // Email
                      DefaultTextFormField(
                          TextInputAction: TextInputAction.next,
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          label: AppStrings.email,
                          prefixIcon: Icons.email_rounded,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.validator;
                            }
                          },
                          onFieldSubmitted: (value) {}),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),

                      // Password
                      DefaultTextFormField(
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          label: AppStrings.password,
                          prefixIcon: Icons.lock,
                          isPassword: cubit.isPassword,
                          suffixIcon: cubit.isPassword
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          suffixPressed: () {
                            cubit.changePasswordAppearance();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.validator;
                            }
                          },
                          onFieldSubmitted: (value) {}),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),

                      // remember me check box
                      InkWell(
                        onTap: () {
                          underDevelopment(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (bool? value) {},
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            const Text(AppStrings.rememberMe),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 80,
                      ),

                      // sign up button
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await cubit.login(
                                  email: email.text, password: password.text);
                            }
                          },
                          child: const Text(AppStrings.signIn)),
                      SizedBox(height: MediaQuery.of(context).size.height / 45),
                      // divider
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              color: ColorManager.lightGrey,
                              height: AppSizeHeight.s1,
                              width: AppSizeWidth.s1,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 45,
                          ),
                          Text(
                            AppStrings.orContinueWith,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          Expanded(
                            child: Container(
                              color: ColorManager.lightGrey,
                              height: AppSizeWidth.s1,
                              width: AppSizeWidth.s1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 45,
                      ),
                      // sign in options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s30),
                            onTap: () {
                              underDevelopment(context);
                            },
                            child: Container(
                              height: AppSizeHeight.s50,
                              width: AppSizeWidth.s90,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSizeWidth.s30),
                                  color: Get.isDarkMode
                                      ? ColorManager.lightGrey
                                      : Colors.transparent,
                                  border:
                                      Border.all(color: ColorManager.grey2)),
                              child: Transform.scale(
                                scale: 0.9,
                                child: SvgPicture.asset(ImageAssets.facebook,
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s30),
                            onTap: () {
                              underDevelopment(context);
                            },
                            child: Container(
                              height: AppSizeHeight.s50,
                              width: AppSizeWidth.s90,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSizeWidth.s30),
                                  color: Get.isDarkMode
                                      ? ColorManager.lightGrey
                                      : Colors.transparent,
                                  border:
                                      Border.all(color: ColorManager.grey2)),
                              child: Transform.scale(
                                scale: 0.8,
                                child: SvgPicture.asset(ImageAssets.google,
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s30),
                            onTap: () {
                              underDevelopment(context);
                            },
                            child: Container(
                              height: AppSizeHeight.s50,
                              width: AppSizeWidth.s90,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSizeWidth.s30),
                                  color: Get.isDarkMode
                                      ? ColorManager.lightGrey
                                      : Colors.transparent,
                                  border:
                                      Border.all(color: ColorManager.grey2)),
                              child: Transform.scale(
                                scale: 0.7,
                                child: SvgPicture.asset(ImageAssets.apple,
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      // Sign in button
                      Row(
                        children: [
                          Text(
                            AppStrings.dontHaveAnAccount,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offAllNamed(Routes.register);
                            },
                            child: Text(
                              AppStrings.signUp,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: ColorManager.primary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
