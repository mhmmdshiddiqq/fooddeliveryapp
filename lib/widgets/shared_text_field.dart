import 'package:flutter/material.dart';

class SharedTextfield extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;

  const SharedTextfield({
    super.key,
    required this.title,
    this.hintText,
    required this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.all(10), child: Text(title)),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          readOnly: readOnly,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
