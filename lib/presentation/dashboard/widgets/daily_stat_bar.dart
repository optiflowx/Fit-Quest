import 'package:fit_quest/app/app_palette.dart';
import 'package:flutter/material.dart';

class DailyStatBar extends StatelessWidget {
  final String day;
  final double value;
  final bool isHighlighted;
  final double maxHeight;
  final double width;

  const DailyStatBar({
    super.key,
    required this.day,
    required this.value,
    this.isHighlighted = false,
    this.maxHeight = 150,
    this.width = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          height: maxHeight * value,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            color: switch (isHighlighted) {
              true => AppPalette.accentOrange,
              false => AppPalette.accentBlue,
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: const TextStyle(
            color: AppPalette.mutedTeal,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
