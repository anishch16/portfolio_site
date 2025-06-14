import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarText extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  const NavbarText({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: GoogleFonts.ibmPlexMono(
              fontSize: 14,
              letterSpacing: 0.14,
              color: theme.colorScheme.onSurface),
        ));
  }
}
