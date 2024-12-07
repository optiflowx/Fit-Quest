
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isInvalid;

  const AppTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.isInvalid = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF91A5A7),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isInvalid ? Colors.red : Colors.transparent,
            width: 1.0,
          ),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
