import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.onTap,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final Function()? onTap;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLines: maxLines,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText ?? '',
        border: const OutlineInputBorder(),
      ),
    );
  }
}
