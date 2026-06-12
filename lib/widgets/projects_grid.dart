import 'package:flutter/material.dart';
import 'package:portfolio_site/data/portfolio_data.dart';
import 'package:portfolio_site/utils/viewport.dart';
import 'package:portfolio_site/widgets/project_card.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final viewport = siteViewportOf(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = switch (viewport) {
          SiteViewport.mobile => 1,
          SiteViewport.tablet => 2,
          SiteViewport.desktop => 3,
        };
        const spacing = 20.0;
        final itemWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: portfolioProjects
              .map(
                (project) => SizedBox(
                  width: itemWidth,
                  child: ProjectCard(project: project),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
