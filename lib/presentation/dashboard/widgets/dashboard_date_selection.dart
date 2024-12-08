import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fit_quest/app/app_palette.dart';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/dashboard_cubit.dart';

class DashboardDateSelection extends StatelessWidget {
  const DashboardDateSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();

    final now = DateTime.now();

    final disabledTextStyle = context.textTheme.bodySmall?.copyWith(
      color: context.theme.dividerColor,
    );

    final activeTextStyle = context.textTheme.bodyMedium?.copyWith(
      color: context.colorScheme.onPrimary,
    );

    final inactiveTextStyle = context.textTheme.bodySmall?.copyWith(
      color: context.theme.dividerColor,
    );

    return EasyDateTimeLine(
      initialDate: now,
      onDateChange: cubit.onDateChange,
      headerProps: const EasyHeaderProps(showHeader: false),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayNumDayStr,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [
                AppPalette.mutedTeal,
                AppPalette.accentOrange,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          dayStrStyle: activeTextStyle,
          dayNumStyle: activeTextStyle?.copyWith(
            fontSize: 20,
          ),
        ),
        inactiveDayStyle: DayStyle(
          dayStrStyle: inactiveTextStyle,
          dayNumStyle: inactiveTextStyle?.copyWith(
            fontSize: 20,
          ),
        ),
        disabledDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: context.theme.dividerColor.withOpacity(.2),
            border: Border.all(
              color: context.theme.dividerColor.withOpacity(.35),
            ),
          ),
          dayStrStyle: disabledTextStyle,
          dayNumStyle: disabledTextStyle?.copyWith(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
