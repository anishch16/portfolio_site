import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_site/data/portfolio_data.dart';
import 'package:portfolio_site/theme/colors.dart';
import 'package:portfolio_site/utils/url_utils.dart';
import 'package:portfolio_site/utils/viewport.dart';
import 'package:portfolio_site/widgets/portfolio_button.dart';
import 'package:portfolio_site/widgets/section_label.dart';
import 'package:portfolio_site/widgets/social_links_row.dart';

class ContactsPage extends StatelessWidget {
  final Key contactsKey;

  const ContactsPage({super.key, required this.contactsKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mobile = isMobile(context);
    final hPad = sectionHorizontalPadding(context);
    final headlineSize = mobile ? 32.0 : 44.0;

    return Container(
      key: contactsKey,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80.h),
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel(label: 'CONTACT'),
          SizedBox(height: 16.h),
          Text(
            "Let's build something",
            style: theme.textTheme.displaySmall?.copyWith(
              fontSize: headlineSize,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
              letterSpacing: -1.5,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: mobile ? double.infinity : 560,
            child: Text(
              PortfolioData.contactBio,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withAlphaFraction(0.65),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            '${PortfolioData.location} · ${PortfolioData.phone}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withAlphaFraction(0.45),
            ),
          ),
          SizedBox(height: 40.h),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              PortfolioButton(
                label: 'Email me',
                trailingIcon: Icons.mail_outline,
                onTap: () => openEmail(
                  PortfolioData.email,
                  subject: 'Portfolio inquiry',
                ),
              ),
              PortfolioButton(
                label: 'Call me',
                variant: PortfolioButtonVariant.outline,
                trailingIcon: Icons.phone_outlined,
                onTap: () => openPhone(PortfolioData.phone),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Text(
            'Find me online',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurface.withAlphaFraction(0.45),
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 16.h),
          const SocialLinksRow(),
        ],
      ),
    );
  }
}
