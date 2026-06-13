import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_site/data/portfolio_data.dart';
import 'package:portfolio_site/theme/colors.dart';
import 'package:portfolio_site/utils/viewport.dart';
import 'package:portfolio_site/widgets/section_label.dart';
import '../utils/url_utils.dart';

class ExperiencePage extends StatelessWidget {
  final Key experienceKey;

  const ExperiencePage({super.key, required this.experienceKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mobile = isMobile(context);
    final hPad = sectionHorizontalPadding(context);
    final headlineSize = mobile ? 32.0 : 44.0;

    return Container(
      key: experienceKey,
      color: theme.colorScheme.surface,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel(label: 'EXPERIENCE'),
          SizedBox(height: 16.h),
          Text(
            'Where I\'ve worked',
            style: theme.textTheme.displaySmall?.copyWith(
              fontSize: headlineSize,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
              letterSpacing: -1.5,
            ),
          ),
          SizedBox(height: 48.h),
          ...PortfolioData.experience.asMap().entries.map((entry) {
            final isLast = entry.key == PortfolioData.experience.length - 1;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 32.h),
              child: _CompanyBlock(
                entry: entry.value,
                mobile: mobile,
                showTimelineTail: !isLast,
              ),
            );
          }),
          SizedBox(height: 48.h),
          const _EducationBlock(education: PortfolioData.education),
        ],
      ),
    );
  }
}

class _CompanyBlock extends StatelessWidget {
  final ExperienceEntry entry;
  final bool mobile;
  final bool showTimelineTail;

  const _CompanyBlock({
    required this.entry,
    required this.mobile,
    required this.showTimelineTail,
  });

  @override
  Widget build(BuildContext context) {
    final content = _CompanyContent(entry: entry);

    if (mobile) return content;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainColor,
                  ),
                ),
                if (showTimelineTail)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withAlphaFraction(0.25),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(child: content),
        ],
      ),
    );
  }
}

class _CompanyContent extends StatelessWidget {
  final ExperienceEntry entry;

  const _CompanyContent({required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withAlphaFraction(0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                    onTap: () => openExternalUrl(entry.website),
                      child: Text(
                        entry.company,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      entry.role,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                entry.dateRange,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withAlphaFraction(0.45),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            entry.summary,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withAlphaFraction(0.65),
              height: 1.7,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Projects',
            style: theme.textTheme.labelMedium?.copyWith(
              letterSpacing: 1.5,
              color: theme.colorScheme.onSurface.withAlphaFraction(0.4),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: entry.projectNames
                .map((name) => _ProjectNameChip(label: name))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectNameChip extends StatelessWidget {
  final String label;

  const _ProjectNameChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: theme.colorScheme.outline.withAlphaFraction(0.25),
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(
          fontSize: 12,
          color: theme.colorScheme.onSurface.withAlphaFraction(0.75),
        ),
      ),
    );
  }
}

class _EducationBlock extends StatelessWidget {
  final EducationEntry education;

  const _EducationBlock({required this.education});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel(label: 'EDUCATION'),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: theme.colorScheme.outline.withAlphaFraction(0.15),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final stackDates = constraints.maxWidth < 520;
              if (stackDates) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      education.degree,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      education.institution,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      education.dateRange,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onSurface.withAlphaFraction(0.45),
                      ),
                    ),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          education.degree,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          education.institution,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    education.dateRange,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withAlphaFraction(0.45),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
