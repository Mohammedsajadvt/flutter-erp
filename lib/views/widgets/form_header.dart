import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final VoidCallback? onFirstPressed;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final VoidCallback? onLastPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onAttachPressed;
  final VoidCallback? onPrintPressed;
  final VoidCallback? onCopyPressed;

  const FormHeader({
    this.onFirstPressed,
    this.onPreviousPressed,
    this.onNextPressed,
    this.onLastPressed,
    this.onSearchPressed,
    this.onAttachPressed,
    this.onPrintPressed,
    this.onCopyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon: Icon(Icons.first_page), onPressed: onFirstPressed ?? () {}),
        IconButton(icon: Icon(Icons.chevron_left), onPressed: onPreviousPressed ?? () {}),
        IconButton(icon: Icon(Icons.chevron_right), onPressed: onNextPressed ?? () {}),
        IconButton(icon: Icon(Icons.last_page), onPressed: onLastPressed ?? () {}),
        SizedBox(width: 20),
        IconButton(icon: Icon(Icons.search), onPressed: onSearchPressed ?? () {}),
        IconButton(icon: Icon(Icons.attach_file), onPressed: onAttachPressed ?? () {}),
        IconButton(icon: Icon(Icons.print), onPressed: onPrintPressed ?? () {}),
        IconButton(icon: Icon(Icons.copy), onPressed: onCopyPressed ?? () {}),
      ],
    );
  }
}
