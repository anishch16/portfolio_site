import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class Testimonials extends StatelessWidget {
  final Key testimonialsKey;
  const Testimonials({super.key, required this.testimonialsKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final padding = EdgeInsets.symmetric(
        horizontal: isMobile ? 120.w : 190.w, vertical: 80.h);
    final crossAxisCount = isMobile ? 1 : 2;

    return Container(
      key: testimonialsKey,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Testimonials",
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
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
              style: GoogleFonts.ibmPlexMono(
                fontSize: 14,
                letterSpacing: 0.14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60.h),
          WaterfallFlow.builder(
            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24.w,
              mainAxisSpacing: 24.h,
            ),
            itemCount: testimonials.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final testimonial = testimonials[index];
              return Container(
                padding: EdgeInsets.all(30.r),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border:
                      Border.all(color: Theme.of(context).colorScheme.surface,
                      
                      ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial.description,
                      style: GoogleFonts.ibmPlexMono(fontSize: 14),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            testimonial.imagePath,
                            height: 50.r,
                            width: 50.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          testimonial.name,
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

final List<TestimonialsModel> testimonials = [
  TestimonialsModel(
    name: "Rishek Pandey",
    description:
        "Anish quickly became a dependable teammate during our work on Ashaconnect and Kilindar. His ability to learn fast and contribute meaningful solutions to production issues really stood out. A solid Flutter developer with great potential.",
    imagePath: 'assets/images/aok.png',
  ),
  TestimonialsModel(
    name: 'Shrawan Kumar',
    description:
        "While working with Anish on Ashaconnect, I was impressed by his grasp of GetX and data handling with SQLite. He’s efficient, focused, and always ready to go the extra mile to deliver clean, maintainable code.",
    imagePath: 'assets/images/connectPersona.png',
  ),
  TestimonialsModel(
    name: 'Basant Chaudhary',
    description:
        "Anish was an important part of our team during the development of DishHome, a-OK, and a-OK Connect. He’s reliable, detail-oriented, and has a great eye for UI/UX. Watching him grow across multiple projects was truly rewarding.",
    imagePath: 'assets/images/dishhome.png',
  ),
  TestimonialsModel(
    name: 'Shiv Shah',
    description:
        "Anish contributed strongly to key modules of DishHome, a-OK, and Connect Persona. Whether it was API integration or building complex widgets, he handled it confidently. A fast learner with a strong work ethic.",
    imagePath: 'assets/images/asha.png',
  ),
  TestimonialsModel(
    name: 'Kilindar Team',
    description:
        "Anish joined us during the Kilindar revamp and adapted quickly to our codebase. His collaboration and code quality made an impact. Looking forward to seeing where his Flutter journey takes him.",
    imagePath: 'assets/images/kilinder.png',
  ),
];

class TestimonialsModel {
  final String name;
  final String description;
  final String imagePath;

  TestimonialsModel(
      {required this.name, required this.description, required this.imagePath});
}
