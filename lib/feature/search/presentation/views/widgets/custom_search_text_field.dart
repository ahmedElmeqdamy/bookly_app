
//
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18,),
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}