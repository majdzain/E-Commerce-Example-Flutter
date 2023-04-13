import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';

class QitTextField extends StatelessWidget {
  Function(String)? onChanged;
  String? errorText;
  String labelText;
  TextEditingController controller;
  Color color;
  Icon? suffixIcon;
  TextInputType keyboardType;
  Function(String)? onSubmitted;
  bool obscureText;
  bool? enabled;
  QitTextField({
    this.onChanged,
    this.errorText,
    required this.labelText,
    required this.controller,
    this.color = CColors.orange,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onSubmitted,
    this.obscureText = false,
    this.enabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: color,
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      enabled: enabled,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(color: color, fontWeight: FontWeight.bold),
        suffixIcon: suffixIcon,
        suffixIconColor: color,
        errorText: errorText,
        errorStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(
            width: 2.0,
            color: color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(
            width: 3.0,
            color: color,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(
            width: 3.0,
            color: Colors.red,
          ),
        ),
      ),
      keyboardType: keyboardType,
      maxLines: 1,
      obscureText: obscureText,
    );
  }
}
