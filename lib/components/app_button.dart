import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final String text;

  const AppButton({
    super.key,
    this.isLoading = false,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFF6367F1),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: switch (isLoading) {
          true => const CircularProgressIndicator(color: Colors.white),
          false => Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        },
      ),
    );
  }
}
