import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_site/pages/contacts.dart';
import 'package:portfolio_site/pages/testimonials.dart';
import '../widgets/navbar_text.dart';
import 'home_page.dart';
import 'projects_page.dart';

class LandingPage extends StatefulWidget {
  final ThemeMode themeMode;
  final Color primaryColor;
  final VoidCallback onToggleTheme;
  final Function(Color) onColorChange;

  const LandingPage({
    super.key,
    required this.themeMode,
    required this.primaryColor,
    required this.onToggleTheme,
    required this.onColorChange,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final homeKey = GlobalKey();
  final projectsKey = GlobalKey();
  final testimonialKey = GlobalKey();
  final recentWorkKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeMode == ThemeMode.dark;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      drawer: _drawer(context),
      floatingActionButton: IconButton(
        icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
        onPressed: widget.onToggleTheme,
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          // ✅ Navbar
          (MediaQuery.of(context).size.width > 1000)
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 85.w).copyWith(bottom: 16.h),
                  color: theme.colorScheme.surface,
                  padding:
                      EdgeInsets.symmetric(horizontal: 95.w, vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NavbarText(
                        text: "Home",
                        onTap: () => scrollTo(homeKey),
                      ),
                      NavbarText(
                        text: "Projects",
                        onTap: () => scrollTo(projectsKey),
                      ),
                      NavbarText(
                        text: "Testimonials",
                        onTap: () => scrollTo(testimonialKey),
                      ),
                      NavbarText(
                        text: "Get In Touch",
                        onTap: () => scrollTo(contactKey),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.facebook,
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.facebook,
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.facebook,
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Builder(
                  builder: (context) => Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        if (Scaffold.of(context).isDrawerOpen) {
                          Navigator.of(context).pop();
                        } else {
                          Scaffold.of(context).openDrawer();
                        }
                      },
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.menu),
                      ),
                    ),
                  ),
                ),

          // ✅ Body Sections
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // 🔵 Home Section
                  HomePage(homeKey: homeKey),
                  // 🟢 Projects Section
                  ProjectsPage(projectsKey: projectsKey),
                  // 🟠 Testimonial Section
                  Testimonials(testimonialsKey: testimonialKey),

                  // 🟡 Contact Section
                  ContactsPage(contactsKey: contactKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Drawer _drawer(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Anish Chaulgain',
                  style: GoogleFonts.ibmPlexMono(
                      fontSize: 28,
                      letterSpacing: 0.14,
                      color: theme.colorScheme.onSurface),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.home_outlined,
                    label: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(homeKey);
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.work_outline,
                    label: 'Projects',
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(projectsKey);
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.people_outline,
                    label: 'Testimonials',
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(testimonialKey);
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.build_outlined,
                    label: 'Recent Works',
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(recentWorkKey);
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.contact_mail_outlined,
                    label: 'Get In Touch',
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(contactKey);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook_outlined),
                    iconSize: 28,
                    tooltip: 'Facebook',
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.linked_camera_outlined),
                    iconSize: 28,
                    tooltip: 'LinkedIn',
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.alternate_email_outlined),
                    iconSize: 28,
                    tooltip: 'Email',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    var theme = Theme.of(context);
    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.ibmPlexMono(
            fontSize: 14,
            letterSpacing: 0.14,
            color: theme.colorScheme.onSurface),
      ),
      onTap: onTap,
      horizontalTitleGap: 8,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
