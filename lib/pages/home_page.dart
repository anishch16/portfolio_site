import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final Key homeKey;
  const HomePage({super.key, required this.homeKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final padding = isMobile
        ? EdgeInsets.symmetric(horizontal: 24 + 95.w)
        : EdgeInsets.symmetric(horizontal: 95.w + 95.w);

    return Container(
      key: homeKey,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80.h),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImageSection(),
                    SizedBox(height: 32.h),
                    _buildTextSection(isMobile),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _buildTextSection(isMobile)),
                    SizedBox(width: 32.w),
                    _buildImageSection(),
                  ],
                ),
          SizedBox(height: 57.h),
          Text(
            "Worked with",
            style: GoogleFonts.ibmPlexMono(
              fontSize: 14,
              letterSpacing: 0.14,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
              height: 60.h,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                companyContainer(context, title: "anka Ek"),
                SizedBox(width: 10.w),
                companyContainer(context, title: "Ayata Inc.")
              ])),
          SizedBox(height: 45.h),
        ],
      ),
    );
  }

  Widget _buildTextSection(bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Anish Chaulagain",
          style: GoogleFonts.raleway(
            fontSize: 44,
            letterSpacing: 0.44,
            fontWeight: FontWeight.bold,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 10.h),
        Text(
          "Intro text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          style: GoogleFonts.ibmPlexMono(
            fontSize: 14,
            letterSpacing: 0.14,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 30.h),
        Align(
          alignment: isMobile ? Alignment.center : Alignment.centerLeft,
          child: ElevatedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
            ),
            onPressed: () {},
            child: FittedBox(
              child: Row(
                children: [
                  Text(
                    "Let's get started",
                    style: GoogleFonts.ibmPlexMono(
                      fontSize: 16,
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
          ),
        )
      ],
    );
  }

  Widget _buildImageSection() {
    return Container(
      width: 350.r,
      height: 350.r,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/images/my_image.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget companyContainer(BuildContext context, {required String title}) {
    var theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(title,
          style: GoogleFonts.ibmPlexMono(
            color: theme.colorScheme.onSurface,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.14,
          )),
    );
  }
}
