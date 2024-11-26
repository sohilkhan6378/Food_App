import 'package:flutter/material.dart';
class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labText;
  final TextInputType keyboardType;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.labText,
    required this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labText,
      ),
    );
  }
}
