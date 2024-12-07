import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:fit_quest/core/exceptions/page_state.dart';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:fit_quest/core/repository/authentication_repository.dart';
import 'package:fit_quest/presentation/authentication/state/sign_in_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState.initial());

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _authenticationRepository = AuthenticationRepository();

  // Getters
  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();
  bool get isSignInFieldsValid => email.isNotEmpty && password.isNotEmpty;

  void _trimTextFields() {
    emailController.text = email.trim();
    passwordController.text = password.trim();
  }

  void navigateToSignUp(BuildContext context) {
    context.push(AppRoutes.authSignUp);
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> signIn() async {
    _trimTextFields();

    if (!isSignInFieldsValid) {
      emit(state.copyWith(
        pageState: PageState.error(message: 'All fields are required.'),
      ));

      return;
    }

    try {
      emit(state.copyWith(pageState: PageState.loading()));

      await _authenticationRepository.signIn(
        email: email,
        password: password,
      );

      emit(state.copyWith(
        pageState: PageState.success(message: 'Sign in successful.'),
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
