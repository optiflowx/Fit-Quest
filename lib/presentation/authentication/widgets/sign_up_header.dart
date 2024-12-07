import 'package:fit_quest/core/extensions/iterable_extensions.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Hey there,',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        const Text(
          'Create an Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ].spacer(const SizedBox(height: 10)),
    );
  }
}
