import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_site/data/portfolio_data.dart';
import 'package:portfolio_site/theme/colors.dart';
import 'package:portfolio_site/utils/url_utils.dart';
import 'package:portfolio_site/utils/viewport.dart';
import 'package:portfolio_site/widgets/navbar_text.dart';
import 'package:portfolio_site/widgets/portfolio_button.dart';
import 'home_page.dart';
import 'projects_page.dart';
import 'skills_page.dart';
import 'experience_page.dart';
import 'contacts.dart';

class LandingPage extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const LandingPage({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final homeKey = GlobalKey();
  final projectsKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();

  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final isScrolled = _scrollController.offset > 40;
      if (isScrolled != _scrolled) setState(() => _scrolled = isScrolled);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeMode == ThemeMode.dark;
    final theme = Theme.of(context);
    final mobile = isMobile(context);
    final hPad = sectionHorizontalPadding(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      drawer: mobile ? _buildDrawer(context) : null,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 72.h),
                HomePage(
                  homeKey: homeKey,
                  onContactTap: () => scrollTo(contactKey),
                  onProjectsTap: () => scrollTo(projectsKey),
                  onResumeTap: () => openExternalUrl(PortfolioData.resumeUrl),
                ),
                SkillsPage(skillsKey: skillsKey),
                ProjectsPage(projectsKey: projectsKey),
                ExperiencePage(experienceKey: experienceKey),
                ContactsPage(contactsKey: contactKey),
                _buildFooter(context, hPad),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildNavbar(context, isDark, mobile, _scrolled, hPad),
          ),
        ],
      ),
    );
  }

  Widget _buildNavbar(
    BuildContext context,
    bool isDark,
    bool mobile,
    bool scrolled,
    double hPad,
  ) {
    final theme = Theme.of(context);
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: 64.h,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary
                .withAlphaFraction(scrolled ? 0.88 : 0.6),
            border: scrolled
                ? Border(
                    bottom: BorderSide(
                      color: theme.colorScheme.outline.withAlphaFraction(0.3),
                      width: 1,
                    ),
                  )
                : null,
          ),
          padding: EdgeInsets.symmetric(horizontal: hPad),
          child: Row(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '< ',
                        style: GoogleFonts.dmSans(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainColor,
                        ),
                      ),
                      Text(
                        'AC',
                        style: GoogleFonts.dmSans(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                          color: AppColors.mainColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Text(
                        ' />',
                        style: GoogleFonts.dmSans(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
              if (!mobile) ...[
                const Spacer(),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        NavbarText(
                            text: 'Home', onTap: () => scrollTo(homeKey)),
                        NavbarText(
                            text: 'Skills', onTap: () => scrollTo(skillsKey)),
                        NavbarText(
                          text: 'Projects',
                          onTap: () => scrollTo(projectsKey),
                        ),
                        NavbarText(
                          text: 'Experience',
                          onTap: () => scrollTo(experienceKey),
                        ),
                        NavbarText(
                          text: 'Contact',
                          onTap: () => scrollTo(contactKey),
                        ),
                        const SizedBox(width: 8),
                        PortfolioButton(
                          label: 'Resume',
                          variant: PortfolioButtonVariant.ghost,
                          compact: true,
                          onTap: () => openExternalUrl(PortfolioData.resumeUrl),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ] else
                const Spacer(),
              GestureDetector(
                onTap: widget.onToggleTheme,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 44,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isDark
                        ? AppColors.mainColor
                        : theme.colorScheme.outline,
                  ),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    alignment:
                        isDark ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 18,
                      height: 18,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? AppColors.darkPrimary : Colors.white,
                      ),
                      child: Icon(
                        isDark ? Icons.dark_mode : Icons.light_mode,
                        size: 11,
                        color: isDark ? AppColors.mainColor : Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
              if (mobile) ...[
                const SizedBox(width: 12),
                Builder(
                  builder: (ctx) => GestureDetector(
                    onTap: () => Scaffold.of(ctx).openDrawer(),
                    child: Icon(Icons.menu, color: theme.colorScheme.onPrimary),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Text(
                'AC.',
                style: GoogleFonts.dmSans(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: AppColors.mainColor,
                  letterSpacing: -1,
                ),
              ),
            ),
            const Divider(height: 1),
            ...[
              ('Home', Icons.home_outlined, homeKey),
              ('Skills', Icons.code_outlined, skillsKey),
              ('Projects', Icons.work_outline, projectsKey),
              ('Experience', Icons.timeline_outlined, experienceKey),
              ('Contact', Icons.mail_outline, contactKey),
            ].map(
              (item) => ListTile(
                leading: Icon(
                  item.$2,
                  color: theme.colorScheme.onSurface,
                  size: 20,
                ),
                title: Text(
                  item.$1,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  scrollTo(item.$3);
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.description_outlined,
                color: theme.colorScheme.onSurface,
                size: 20,
              ),
              title: Text(
                'Resume',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                openExternalUrl(PortfolioData.resumeUrl);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, double hPad) {
    final theme = Theme.of(context);
    final mobile = isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 32.h),
      color: theme.colorScheme.primary,
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '© 2025 ${PortfolioData.name}',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Built with Flutter',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2025 ${PortfolioData.name}',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                Text(
                  'Built with Flutter',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
    );
  }
}
