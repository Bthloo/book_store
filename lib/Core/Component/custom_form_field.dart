import 'package:flutter/material.dart';
typedef MyValidator = String? Function(String?);
class CustomFormField extends StatelessWidget {
final String hintText ;
final MyValidator validator;
final TextEditingController controller;
final TextInputType keyboardType ;
final IconButton? suffix;
final bool isPassword;
const CustomFormField({super.key,
  required this.hintText,
  required this.validator,
  required this.controller,
  this.keyboardType = TextInputType.text,
  this.suffix,
  this.isPassword = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isPassword,
      //textDirection: TextDirection,
      style: const TextStyle(
          color: Color(0xff444444)
      ),
      decoration: InputDecoration(
        suffixIcon: suffix,
        //labelText: 'Email',
        hintText: hintText,
        //suffixIcon: ,
        hintStyle: const TextStyle(
          color: Color(0xff444444)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        // fillColor:const Color(0xff444444),
        //   filled: true
      ),
    );
  }
}
