import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:portfolio_site/data/portfolio_data.dart';
import 'package:portfolio_site/utils/url_utils.dart';

class SocialLinksRow extends StatelessWidget {
  final double spacing;

  const SocialLinksRow({super.key, this.spacing = 12});

  ButtonType _buttonTypeFor(String iconName) {
    return switch (iconName) {
      'github' => ButtonType.github,
      'linkedin' => ButtonType.linkedin,
      _ => ButtonType.email,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < portfolioSocialLinks.length; i++) ...[
          if (i > 0) SizedBox(width: spacing),
          FlutterSocialButton(
            mini: true,
            buttonType: _buttonTypeFor(portfolioSocialLinks[i].iconName),
            onTap: () => openExternalUrl(portfolioSocialLinks[i].url),
          ),
        ],
      ],
    );
  }
}
