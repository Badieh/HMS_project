import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital/components/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
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
                // remember me check box
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    const Text('Remember me',),
                  ],
                ),

                // sign up button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
