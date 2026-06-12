import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_site/theme/colors.dart';

class NavbarText extends StatefulWidget {
  final VoidCallback? onTap;
  final String text;

  const NavbarText({super.key, required this.onTap, required this.text});

  @override
  State<NavbarText> createState() => _NavbarTextState();
}

class _NavbarTextState extends State<NavbarText> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: widget.onTap,
        style: TextButton.styleFrom(
          foregroundColor: _hovered
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onPrimary.withAlphaFraction(0.65),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        child: Text(
          widget.text,
          style: theme.textTheme.labelLarge?.copyWith(
            color: _hovered
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onPrimary.withAlphaFraction(0.65),
          ),
        ),
      ),
    );
  }
}
