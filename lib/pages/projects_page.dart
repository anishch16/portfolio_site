import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsPage extends StatelessWidget {
  final Key projectsKey;
  const ProjectsPage({super.key, required this.projectsKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 800;
    final padding = EdgeInsets.symmetric(
        horizontal: isMobile ? 120.w : 190.w, vertical: 80.h);

    return Container(
      key: projectsKey,
      padding: padding,
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Projects",
            style: GoogleFonts.raleway(
              fontSize: 44,
              letterSpacing: 0.44,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: isMobile ? double.infinity : 600.w,
            child: Text(
              "Solving user & business problems since last 15+ years. Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
              style: GoogleFonts.ibmPlexMono(
                fontSize: 14,
                letterSpacing: 0.14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60.h),
          Column(
            children: projects.asMap().entries.map((entry) {
              final index = entry.key;
              final project = entry.value;

              final imageWidget =
                  _buildImageSection(imagePath: project.imagePath);
              final detailWidget = _buildProjectDetails(
                  context,
                  title: project.title,
                  description: project.description,
                  isMobile);
              return Padding(
                padding: EdgeInsets.only(bottom: 80.h),
                child: isMobile
                    ? Column(
                        children: [
                          imageWidget,
                          SizedBox(height: 20.h),
                          detailWidget,
                        ],
                      )
                    : Row(
                        children: index.isEven
                            ? [
                                Expanded(child: detailWidget),
                                SizedBox(width: 26.w),
                                imageWidget,
                              ]
                            : [
                                imageWidget,
                                SizedBox(width: 26.w),
                                Expanded(child: detailWidget),
                              ],
                      ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildImageSection({
    required String imagePath,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80.r),
      child: Container(
        height: 400.r,
        width: 400.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(
              imagePath
                // 'assets/images/my_image.jpeg'
                ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectDetails(
    BuildContext context,
    bool isMobile, {
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // "Connect Persona",
          style: GoogleFonts.raleway(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 10.h),
        Text(
          description,
          // "Intro text: Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
          style: GoogleFonts.ibmPlexMono(
            fontSize: 14,
            letterSpacing: 0.14,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 20.h),
        Align(
          alignment: isMobile ? Alignment.center : Alignment.centerLeft,
          child: ElevatedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.orange),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View More",
                  style: GoogleFonts.ibmPlexMono(
                    fontSize: 12,
                    letterSpacing: 0.16,
                  ),
                ),
                SizedBox(width: 10.w),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

final List<Project> projects = [
  Project(
    title: 'a-OK',
    description:
        'An app to promote gratitude and kindness. Developed scalable features using BLoC/Cubit. Delivered visually appealing interfaces that improved user retention by 25%.',
    imagePath: 'assets/images/aok.png', // replace with actual image
  ),
  Project(
    title: 'a-OK Connect',
    description:
        'Secure profile management app for controlled info sharing. Designed intuitive dashboard for managing Personas. Built cross-platform using Flutter for iOS and Android.',
    imagePath: 'assets/images/connectPersona.png', // replace with actual image
  ),
  Project(
    title: 'Dishhome',
    description:
        'Feature-rich media streaming app. Used GetX and MVC architecture. Integrated secure payment gateways and REST APIs for dynamic content delivery.',
    imagePath: 'assets/images/dishhome.png', // replace with actual image
  ),
  Project(
    title: 'Ashaconnect',
    description:
        'Health data collection app for rural healthcare workers. Used GetX and SQLite. Reduced data input errors by 30% with optimized workflows.',
    imagePath: 'assets/images/asha.png', // replace with actual image
  ),
  Project(
    title: 'Kilindar',
    description:
        'Nationwide bus ticketing platform. Designed intuitive UI using MVVM architecture. Enhanced app performance using Dio and efficient REST API calls.',
    imagePath: 'assets/images/kilinder.png', // replace with actual image
  ),
];

class Project {
  final String title;
  final String description;
  final String imagePath;

  Project(
      {required this.title,
      required this.description,
      required this.imagePath});
}
