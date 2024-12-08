import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state/dashboard_cubit.dart';
import 'widgets/dashboard_date_selection.dart';
import 'widgets/plan_view.dart';
import 'widgets/weekly_stats_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final username = context.select(
      (DashboardCubit cubit) => cubit.state.username,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Background color
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: context.topPadding + 16,
          bottom: context.bottomPadding + 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "EVERYDAY WE'RE MUSCLE'N",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Hello, $username👋",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const DashboardDateSelection(),
            const SizedBox(height: 32),
            const PlanView(),
            const SizedBox(height: 32),
            const WeeklyStatsView(),
          ],
        ),
      ),
    );
  }
}
