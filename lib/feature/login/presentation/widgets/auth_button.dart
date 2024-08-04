import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.color,
      required this.textColor,
      required this.isLoading,
      required this.isDisabled});
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(color),
          ),
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  label,
                  style: TextStyle(color: textColor),
                ),
        ),
      ),
    );
  }
}
