import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.label,
      required this.controller,
      required this.keyboardType,
      required this.obscureText,
      required this.autocorrect,
      required this.autofocus,
      required this.readOnly,
      required this.enableSuggestions});
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool autocorrect;
  final bool autofocus;
  final bool readOnly;
  final bool enableSuggestions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        autocorrect: autocorrect,
        autofocus: autofocus,
        readOnly: readOnly,
        enableSuggestions: enableSuggestions,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
