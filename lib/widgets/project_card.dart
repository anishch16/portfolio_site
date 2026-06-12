import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_site/data/portfolio_data.dart';
import 'package:portfolio_site/theme/colors.dart';
import 'package:portfolio_site/utils/url_utils.dart';

class ProjectCard extends StatefulWidget {
  final PortfolioProject project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  bool get _hasStoreLink => widget.project.playStoreUrl != null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final project = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor:
          _hasStoreLink ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: _hasStoreLink
            ? () => openExternalUrl(project.playStoreUrl!)
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          transform: Matrix4.identity()..scale(_hovered ? 1.01 : 1.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered
                  ? AppColors.lime.withAlphaFraction(0.35)
                  : theme.colorScheme.outline.withAlphaFraction(0.12),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 10,
                child: Image.asset(
                  project.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => ColoredBox(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Center(
                      child: Icon(
                        Icons.phone_android_outlined,
                        size: 40,
                        color: theme.colorScheme.onSurface.withAlphaFraction(0.15),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
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
                              Text(
                                project.title,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                project.category,
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withAlphaFraction(0.4),
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (project.metric != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppColors.lime.withAlphaFraction(0.35),
                              ),
                            ),
                            child: Text(
                              project.metric!,
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontSize: 9,
                                color: AppColors.lime,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      project.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 13,
                        height: 1.65,
                        color:
                            theme.colorScheme.onSurface.withAlphaFraction(0.6),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: project.tags
                          .map(
                            (tag) => Text(
                              tag,
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontSize: 10,
                                color: theme.colorScheme.onSurface
                                    .withAlphaFraction(0.45),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            project.company,
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontSize: 11,
                              color: theme.colorScheme.onSurface
                                  .withAlphaFraction(0.35),
                            ),
                          ),
                        ),
                        if (_hasStoreLink)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.shop,
                                size: 14,
                                color: _hovered
                                    ? AppColors.lime
                                    : theme.colorScheme.onSurface
                                        .withAlphaFraction(0.45),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Play Store',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontSize: 12,
                                  color: _hovered
                                      ? AppColors.lime
                                      : theme.colorScheme.onSurface
                                          .withAlphaFraction(0.55),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
