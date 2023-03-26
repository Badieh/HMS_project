import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/hands3.svg',
                    width: 200,
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
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email',
                    prefixIcon: Icons.email_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password can\'t be empty';
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
                    label: 'Password',
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.remove_red_eye,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password can\'t be empty';
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),

                // remember me check box
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    const Text(AppStrings.rememberMe),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),

                // sign up button
                ElevatedButton(
                    onPressed: () {}, child: const Text(AppStrings.signIn)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                // divider
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        color: ColorManager.lightGrey,
                        height: AppSizew.s1,
                        width: AppSizew.s1,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
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
                        height: AppSizew.s1,
                        width: AppSizew.s1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                // sign in options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(AppSizew.s30),
                      onTap: () {},
                      child: Container(
                        height: AppSizew.s65,
                        width: AppSizew.s90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSizew.s30),
                            border: Border.all(color: ColorManager.grey2)),
                        child: Transform.scale(
                          scale: 0.9,
                          child: SvgPicture.asset(ImageAssets.facebook,
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(AppSizew.s30),
                      onTap: () {},
                      child: Container(
                        height: AppSizew.s65,
                        width: AppSizew.s90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSizew.s30),
                            border: Border.all(color: ColorManager.grey2)),
                        child: Transform.scale(
                          scale: 0.8,
                          child: SvgPicture.asset(ImageAssets.google,
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(AppSizew.s30),
                      onTap: () {},
                      child: Container(
                        height: AppSizew.s65,
                        width: AppSizew.s90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSizew.s30),
                            border: Border.all(color: ColorManager.grey2)),
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
                  height: MediaQuery.of(context).size.height / 50,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));

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
    );
  }
}
