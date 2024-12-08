import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:fit_quest/presentation/authentication/views/sign_up_view.dart';
import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/sign_up_cubit.dart';
import '../state/sign_up_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.pageState.isError) {
            context.showErrorSnackBar(state.pageState.failure!.message);
          }

          if (state.pageState.isLoaded) {
            context.replace(AppRoutes.onboardingOne);
          }
        },
        child: const SignUpView(),
      ),
    );
  }
}
