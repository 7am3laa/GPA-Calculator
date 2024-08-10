import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isName;
  final TextEditingController controller;
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.isName = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'This field is required' : null,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        hintTextDirection: isName ? TextDirection.rtl : TextDirection.ltr,
      ),
      textAlign: isName ? TextAlign.right : TextAlign.left,
      textDirection: isName ? TextDirection.rtl : TextDirection.ltr,
      style: const TextStyle(color: Colors.black),
    );
  }
}
