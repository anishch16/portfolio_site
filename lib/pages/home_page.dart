import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_site/data/portfolio_data.dart';
import 'package:portfolio_site/theme/colors.dart';
import 'package:portfolio_site/utils/viewport.dart';
import 'package:portfolio_site/widgets/portfolio_button.dart';

class HomePage extends StatefulWidget {
  final Key homeKey;
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onResumeTap;

  const HomePage({
    super.key,
    required this.homeKey,
    required this.onContactTap,
    required this.onProjectsTap,
    required this.onResumeTap,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final String _fullCommand = r'$ flutter run chaulagain_anish.dart';
  String _displayedCommand = '';
  bool _cursorVisible = true;
  Timer? _typeTimer;
  Timer? _cursorTimer;
  int _charIndex = 0;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);

    Future.delayed(const Duration(milliseconds: 400), _startTyping);

    _cursorTimer = Timer.periodic(const Duration(milliseconds: 530), (_) {
      if (mounted) setState(() => _cursorVisible = !_cursorVisible);
    });
  }

  void _startTyping() {
    _typeTimer = Timer.periodic(const Duration(milliseconds: 60), (timer) {
      if (_charIndex < _fullCommand.length) {
        setState(() {
          _displayedCommand = _fullCommand.substring(0, _charIndex + 1);
          _charIndex++;
        });
      } else {
        timer.cancel();
        _fadeController.forward();
      }
    });
  }

  @override
  void dispose() {
    _typeTimer?.cancel();
    _cursorTimer?.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mobile = isMobile(context);
    final hPad = sectionHorizontalPadding(context);
    final headlineSize = mobile ? 42.0 : 64.0;
    final avatarSize = mobile ? 220.0 : 380.0;

    return Container(
      key: widget.homeKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: mobile ? 60.h : 80.h,
      ),
      color: theme.colorScheme.primary,
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTerminalChip(context),
                SizedBox(height: 32.h),
                _buildHeroText(context, headlineSize, mobile),
                SizedBox(height: 40.h),
                _buildAvatar(context, avatarSize),
                SizedBox(height: 40.h),
                _buildCTARow(context),
                SizedBox(height: 48.h),
                _buildCompanyRow(context),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTerminalChip(context),
                SizedBox(height: 40.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeroText(context, headlineSize, mobile),
                          SizedBox(height: 40.h),
                          _buildCTARow(context),
                        ],
                      ),
                    ),
                    SizedBox(width: 60.w),
                    Expanded(
                      flex: 4,
                      child: Center(child: _buildAvatar(context, avatarSize)),
                    ),
                  ],
                ),
                SizedBox(height: 64.h),
                _buildCompanyRow(context),
              ],
            ),
    );
  }

  Widget _buildTerminalChip(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: theme.colorScheme.outline.withAlphaFraction(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _displayedCommand,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 13,
              color: AppColors.mainColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          AnimatedOpacity(
            opacity: _cursorVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: 8,
              height: 14,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroText(
      BuildContext context, double headlineSize, bool mobile) {
    final theme = Theme.of(context);
    return FadeTransition(
      opacity: _fadeAnim,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: theme.textTheme.displaySmall?.copyWith(
                fontSize: headlineSize,
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.onPrimary,
                height: 1.1,
                letterSpacing: -2,
              ),
              children: [
                const TextSpan(text: 'I build\n'),
                TextSpan(
                  text: 'beautiful\n',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: headlineSize,
                    fontWeight: FontWeight.w800,
                    color: AppColors.mainColor,
                    height: 1.1,
                    letterSpacing: -2,
                  ),
                ),
                const TextSpan(text: 'Flutter apps.'),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            PortfolioData.title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onPrimary.withAlphaFraction(0.75),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            PortfolioData.professionalSummary,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary.withAlphaFraction(0.55),
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        // shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/portfolio.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: AppColors.mainColor, width: 3),
      ),
    );
  }

  Widget _buildCTARow(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        children: [
          PortfolioButton(
            label: 'Get in touch',
            trailingIcon: Icons.arrow_forward,
            onTap: widget.onContactTap,
          ),
          PortfolioButton(
            label: 'View projects',
            variant: PortfolioButtonVariant.outline,
            onTap: widget.onProjectsTap,
          ),
          PortfolioButton(
            label: 'Download resume',
            trailingIcon: Icons.download,
            variant: PortfolioButtonVariant.outline,
            onTap: widget.onResumeTap,
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyRow(BuildContext context) {
    final theme = Theme.of(context);
    return FadeTransition(
      opacity: _fadeAnim,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WORKED WITH',
            style: theme.textTheme.labelMedium?.copyWith(
              letterSpacing: 2,
              color: theme.colorScheme.onPrimary.withAlphaFraction(0.35),
            ),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: const [
              _CompanyChip(name: 'Ankaek Pvt. Ltd.'),
              _CompanyChip(name: 'Ayata Incorporation'),
            ],
          ),
        ],
      ),
    );
  }
}

class _CompanyChip extends StatelessWidget {
  final String name;

  const _CompanyChip({required this.name});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border:
            Border.all(color: theme.colorScheme.outline.withAlphaFraction(0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        name,
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.onPrimary.withAlphaFraction(0.6),
        ),
      ),
    );
  }
}
