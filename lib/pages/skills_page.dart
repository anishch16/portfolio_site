import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_site/data/portfolio_data.dart';
import 'package:portfolio_site/theme/colors.dart';
import 'package:portfolio_site/utils/viewport.dart';
import 'package:portfolio_site/widgets/section_label.dart';

class SkillsPage extends StatelessWidget {
  final Key skillsKey;

  const SkillsPage({super.key, required this.skillsKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mobile = isMobile(context);
    final viewport = siteViewportOf(context);
    final hPad = sectionHorizontalPadding(context);
    final headlineSize = mobile ? 32.0 : 44.0;

    return Container(
      key: skillsKey,
      color: theme.colorScheme.surface,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel(label: 'SKILLS'),
          SizedBox(height: 16.h),
          Text(
            'What I work with',
            style: theme.textTheme.displaySmall?.copyWith(
              fontSize: headlineSize,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
              letterSpacing: -1.5,
            ),
          ),
          SizedBox(height: 48.h),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = switch (viewport) {
                SiteViewport.mobile => 1,
                SiteViewport.tablet => 2,
                SiteViewport.desktop => 3,
              };
              const spacing = 24.0;
              final itemWidth =
                  (constraints.maxWidth - spacing * (columns - 1)) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: skillCategories
                    .map(
                      (cat) => SizedBox(
                        width: itemWidth,
                        child: _SkillCategory(category: cat),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final SkillCategory category;

  const _SkillCategory({required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lime,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              category.title,
              style: theme.textTheme.labelMedium?.copyWith(
                letterSpacing: 1.5,
                color: theme.colorScheme.onSurface.withAlphaFraction(0.5),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              category.skills.map((s) => _SkillChip(label: s)).toList(),
        ),
      ],
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.lime.withAlphaFraction(0.12)
              : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _hovered
                ? AppColors.lime.withAlphaFraction(0.6)
                : theme.colorScheme.outline.withAlphaFraction(0.2),
          ),
        ),
        child: Text(
          widget.label,
          style: theme.textTheme.labelLarge?.copyWith(
            fontSize: 12,
            color: _hovered
                ? AppColors.lime
                : theme.colorScheme.onSurface.withAlphaFraction(0.75),
            fontWeight: _hovered ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
