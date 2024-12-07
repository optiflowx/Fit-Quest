import 'package:fit_quest/components/app_button.dart';
import 'package:fit_quest/components/app_textfield.dart';
import 'package:fit_quest/core/extensions/iterable_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/sign_up_cubit.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/sign_up_header.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    final isLoading = context.select(
      (SignUpCubit cubit) => cubit.state.pageState.isLoading,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SignUpHeader(),
                const SizedBox(height: 30),
                ...<Widget>[
                  AppTextField(
                    controller: cubit.nameController,
                    icon: Icons.person_outline,
                    hintText: 'Full Name',
                  ),
                  AppTextField(
                    controller: cubit.emailController,
                    icon: Icons.email_outlined,
                    hintText: 'Email',
                  ),
                  AppTextField(
                    controller: cubit.passwordController,
                    icon: Icons.lock_outline,
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  AppTextField(
                    controller: cubit.confirmPasswordController,
                    icon: Icons.lock_outline,
                    hintText: 'Confirm Password',
                    isPassword: true,
                  ),
                ].spacer(const SizedBox(height: 10)),
                const SizedBox(height: 20),
                AppButton(
                  onPressed: () async => await cubit.signUp(),
                  text: 'Sign Up',
                  isLoading: isLoading,
                ),
                const Text(
                  '----Or sign up with----',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                GoogleSignInButton(onPressed: () {}),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14),
                    children: [
                      const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.white54),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                          color: Color(0xFF6367F1),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => cubit.navigateToSignIn(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
