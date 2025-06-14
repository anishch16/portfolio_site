import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactsPage extends StatelessWidget {
  final Key contactsKey;
  const ContactsPage({super.key, required this.contactsKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 800;
    final padding = EdgeInsets.symmetric(
        horizontal: isMobile ? 120.w : 190.w, vertical: 80.h);

    return Container(
      key: contactsKey,
      padding: padding,
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get in touch",
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 250.w),
            child: Column(
              children: [
                TextField(
                  cursorColor: theme.colorScheme.onPrimary,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(),
                    errorBorder: const OutlineInputBorder(),
                    focusedErrorBorder: const OutlineInputBorder(),
                    fillColor: theme.colorScheme.primary,
                    hintText: 'Enter your name',
                  ),
                ),
                SizedBox(height: 20.h),
                TextField(
                  cursorColor: theme.colorScheme.onPrimary,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(),
                    errorBorder: const OutlineInputBorder(),
                    focusedErrorBorder: const OutlineInputBorder(),
                    fillColor: theme.colorScheme.primary,
                    hintText: 'Enter Email Address',
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  maxLines: 5,
                  cursorColor: theme.colorScheme.onPrimary,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(),
                    errorBorder: const OutlineInputBorder(),
                    focusedErrorBorder: const OutlineInputBorder(),
                    fillColor: theme.colorScheme.primary,
                    hintText: 'Enter your message',
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Submit",
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
