import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_site/data/portfolio_data.dart';
import 'package:portfolio_site/theme/colors.dart';
import 'package:portfolio_site/utils/viewport.dart';
import 'package:portfolio_site/widgets/projects_grid.dart';
import 'package:portfolio_site/widgets/section_label.dart';

class ProjectsPage extends StatelessWidget {
  final Key projectsKey;

  const ProjectsPage({super.key, required this.projectsKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mobile = isMobile(context);
    final hPad = sectionHorizontalPadding(context);
    final headlineSize = mobile ? 32.0 : 44.0;

    return Container(
      key: projectsKey,
      color: theme.colorScheme.primary,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel(label: 'PROJECTS'),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  'Apps I\'ve shipped',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: headlineSize,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onPrimary,
                    letterSpacing: -1.5,
                  ),
                ),
              ),
              if (!mobile)
                Text(
                  '${portfolioProjects.length} projects',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onPrimary.withAlphaFraction(0.35),
                  ),
                ),
            ],
          ),
          SizedBox(height: 40.h),
          const ProjectsGrid(),
        ],
      ),
    );
  }
}
