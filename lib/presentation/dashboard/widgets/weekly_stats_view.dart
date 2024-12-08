import 'package:fit_quest/app/app_palette.dart';
import 'package:flutter/material.dart';

import 'daily_stat_bar.dart';

class WeeklyStatsView extends StatelessWidget {
  const WeeklyStatsView({super.key});

  static const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const values = [0.6, 0.5, 0.4, 0.7, 1.0, 0.5, 0.25];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weekly Stats',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Most Active Day: ',
                  style: TextStyle(color: AppPalette.mutedTeal),
                ),
                TextSpan(
                  text: days[4],
                  style: const TextStyle(
                    color: AppPalette.accentOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              days.length,
              (index) => DailyStatBar(
                day: days[index],
                value: values[index],
                isHighlighted: index == 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
