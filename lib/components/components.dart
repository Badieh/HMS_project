import 'package:flutter/material.dart';

Widget DefaultTextFormField(
        {required TextEditingController controller,
        required TextInputType keyboardType,
        required String label,
        required IconData prefixIcon,
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
    );

Widget DefualtButton({required String text, required VoidCallback onPressed}) =>
    SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Do something when the button is pressed
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        child: Text(text),
      ),
    );
