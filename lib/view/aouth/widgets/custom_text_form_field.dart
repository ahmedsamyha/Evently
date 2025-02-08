import 'package:evently/utility/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utility/helper/helper_funcation.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
       this.prefixIcon,
       this.hint,
        this.maxLines,
      required this.controller,
      required this.validator,
      required this.onChanged,
      required this.keyboardType,
      this.suffixIcon,
         this.label, required this.obscureText});
   IconData? prefixIcon;
  IconData? suffixIcon;
  String? label;
   String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText ;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return TextFormField(
      style: TextStyle(color: dark? AppColors.textDarkWhite:AppColors.textGray,fontSize: 16,fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: Icon(suffixIcon),
        labelText: label,
        hintText: hint,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal:16),

      ),
      maxLines:maxLines ,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
