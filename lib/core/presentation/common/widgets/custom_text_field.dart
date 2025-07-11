import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? fieldName;
  const CustomTextField({
    super.key,
    this.fieldName,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(widget.fieldName ?? ''), const SizedBox(height: 4), TextFormField()]);
  }
}
