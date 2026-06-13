import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_site/theme/colors.dart';

enum PortfolioButtonVariant { primary, outline, ghost }

class PortfolioButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final PortfolioButtonVariant variant;
  final IconData? trailingIcon;
  final bool compact;

  const PortfolioButton({
    super.key,
    required this.label,
    required this.onTap,
    this.variant = PortfolioButtonVariant.primary,
    this.trailingIcon,
    this.compact = false,
  });

  @override
  State<PortfolioButton> createState() => _PortfolioButtonState();
}

class _PortfolioButtonState extends State<PortfolioButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = widget.compact
        ? const EdgeInsets.symmetric(horizontal: 16, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 14);

    Color background;
    Color foreground;
    Border? border;

    switch (widget.variant) {
      case PortfolioButtonVariant.primary:
        background =
            _hovered ? AppColors.mainColorDeep : AppColors.mainColor;
        foreground = AppColors.darkPrimary;
        border = null;
      case PortfolioButtonVariant.outline:
        background = _hovered
            ? theme.colorScheme.onPrimary.withAlphaFraction(0.06)
            : Colors.transparent;
        foreground = theme.colorScheme.onPrimary;
        border = Border.all(
          color: _hovered
              ? AppColors.mainColor.withAlphaFraction(0.6)
              : theme.colorScheme.outline.withAlphaFraction(0.5),
        );
      case PortfolioButtonVariant.ghost:
        background = _hovered
            ? theme.colorScheme.onPrimary.withAlphaFraction(0.08)
            : Colors.transparent;
        foreground = theme.colorScheme.onPrimary.withAlphaFraction(0.85);
        border = null;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovered ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: padding,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(6),
              border: border,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: widget.compact ? 13 : 14,
                    fontWeight: FontWeight.w700,
                    color: foreground,
                    letterSpacing: -0.2,
                  ),
                ),
                if (widget.trailingIcon != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    widget.trailingIcon,
                    size: 16,
                    color: foreground,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
