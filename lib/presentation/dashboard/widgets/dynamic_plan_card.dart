import 'package:fit_quest/core/extensions/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fit_quest/app/app_palette.dart';

class DynamicPlanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconBackgroundColor;
  final VoidCallback? onTap;
  final Axis direction;

  const DynamicPlanCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.backgroundColor,
    this.iconBackgroundColor,
    this.onTap,
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: switch (backgroundColor == null) {
            true => Border.all(color: AppPalette.secondaryDark),
            false => null,
          },
        ),
        child: Wrap(
          direction: direction,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: switch (direction) {
            Axis.vertical => WrapAlignment.start,
            Axis.horizontal => WrapAlignment.center,
          },
          crossAxisAlignment: WrapCrossAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconBackgroundColor ?? Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textStyle),
                Text(subtitle, style: textStyle),
              ],
            ),
          ].shouldReversed(direction == Axis.horizontal).toList(),
        ),
      ),
    );
  }
}
