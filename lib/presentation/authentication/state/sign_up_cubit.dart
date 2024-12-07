import 'package:fit_quest/core/exceptions/page_state.dart';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:fit_quest/core/repository/authentication_repository.dart';
import 'package:fit_quest/presentation/authentication/state/sign_up_state.dart';
import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initial());

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  // Repository
  final _authenticationRepository = AuthenticationRepository();

  // Text Getters
  String get name => nameController.text;
  String get email => emailController.text;
  String get password => passwordController.text;
  String get confirmPassword => confirmPasswordController.text;

  bool get isSignUpFieldsValid {
    final a = name.isNotEmpty;
    final b = email.isNotEmpty;
    final c = password.isNotEmpty;
    final d = confirmPassword.isNotEmpty;

    return a && b && c && d;
  }

  bool get isSignInFieldsValid {
    final a = email.isNotEmpty;
    final b = password.isNotEmpty;

    return a && b;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void _resetTextFields() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    confirmPasswordController.clear();
  }

  void _trimTextFields() {
    emailController.text = emailController.text.trim();
    passwordController.text = passwordController.text.trim();
    nameController.text = nameController.text.trim();
    confirmPasswordController.text = confirmPasswordController.text.trim();
  }

  void navigateToSignIn(BuildContext context) {
    _resetTextFields();

    context.push(AppRoutes.authSignIn);
  }

  Future<void> signUp() async {
    _trimTextFields();

    if (!isSignUpFieldsValid) {
      emit(state.copyWith(
        pageState: PageState.error(message: 'All fields are required.'),
      ));

      return;
    }

    if (password != confirmPassword) {
      emit(state.copyWith(
        pageState: PageState.error(message: 'Passwords do not match.'),
      ));

      return;
    }

    emit(state.copyWith(pageState: PageState.loading()));

    try {
      await _authenticationRepository.signUp(
        email: email,
        name: name,
        password: password,
      );

      emit(state.copyWith(
        pageState: PageState.success(message: 'Sign up successful.'),
      ));

    } catch (e, st) {
      emit(state.copyWith(
        pageState: PageState.error(message: e.toString(), stackTrace: st),
      ));
    } finally {
      emit(state.copyWith(pageState: PageState.initial()));
    }
  }
}
