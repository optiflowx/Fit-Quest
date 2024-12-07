import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/sign_in_view.dart';
import '../state/sign_in_cubit.dart';
import '../state/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) async {
          if (state.pageState.isError) {
            context.showErrorSnackBar(state.pageState.failure!.message);
          }

          if (state.pageState.isLoaded) {
            if (context.mounted) {
              context.showSuccessSnackBar(state.pageState.success!.message);
            }

            await context.replace(AppRoutes.home);
          }
        },
        child: const SignInView(),
      ),
    );
  }
}
