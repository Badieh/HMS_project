import 'package:flutter/material.dart';

Widget DefaultTextFormField(
        {required TextEditingController controller,
        required TextInputType keyboardType,
        required String label,
         IconData ?prefixIcon,
        IconData? suffixIcon,
        VoidCallback? suffixPressed,
        required FormFieldValidator<String>? validator,
        required ValueChanged<String>? onFieldSubmitted,
        bool isPassword = false,
        TextInputAction? TextInputAction}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          size: 25,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
      ),
      obscureText: isPassword,
      onTapOutside: (value){FocusManager.instance.primaryFocus?.unfocus();},
    );
