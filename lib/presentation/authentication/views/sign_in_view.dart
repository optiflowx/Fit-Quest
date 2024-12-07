import 'package:fit_quest/components/app_button.dart';
import 'package:fit_quest/components/app_textfield.dart';
import 'package:fit_quest/presentation/authentication/state/sign_in_cubit.dart';
import 'package:fit_quest/presentation/authentication/widgets/sign_in_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/google_sign_in_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();

    final isLoading = context.select(
      (SignInCubit cubit) => cubit.state.pageState.isLoading,
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SignInHeader(),
              const SizedBox(height: 20),
              AppTextField(
                controller: cubit.emailController,
                icon: Icons.email_outlined,
                hintText: 'Email',
              ),
              const SizedBox(height: 10),
              AppTextField(
                controller: cubit.passwordController,
                icon: Icons.lock_outline,
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 20),
              AppButton(
                onPressed: cubit.signIn,
                isLoading: isLoading,
                text: 'Sign In',
              ),
              TextButton(
                onPressed: () async {},
                child: const Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Text(
                '----Or sign in with----',
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              GoogleSignInButton(onPressed: () {}),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 14),
                  children: [
                    const TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: Colors.white54),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: Color(0xFF6367F1),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => cubit.navigateToSignUp(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
