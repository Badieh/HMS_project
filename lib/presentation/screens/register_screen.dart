import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/components.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/hands3.svg',
                    width: 200,
                  ),
                ),
                const Text('Create new account',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),

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
                    const Text('Remember me'),
                  ],
                ),
                // sign up button
                DefualtButton(text: 'Sign up', onPressed: () {}),
                // Sign in button
                Row(
                  children: [
                    const Text('Already have an account ?',
                        style: TextStyle(color: Colors.grey)),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.blue),
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
