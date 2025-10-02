import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final String? hintText;
  final TextInputType? keyboardType;

  const CustomTextField({super.key, 
    required this.label,
    this.controller,
    this.onChanged,
    this.maxLines = 1,
    this.hintText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12)),
        SizedBox(height: 4),
        TextField(
          controller: controller,
          onChanged: onChanged,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
