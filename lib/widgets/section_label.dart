import 'package:flutter/material.dart';
import 'package:portfolio_site/theme/colors.dart';

class SectionLabel extends StatelessWidget {
  final String label;

  const SectionLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(width: 20, height: 1.5, color: AppColors.lime),
        const SizedBox(width: 8),
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
            color: AppColors.lime,
          ),
        ),
      ],
    );
  }
}
