import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_site/main.dart';

void main() {
  testWidgets('Portfolio app loads landing page', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(1280, 800),
        builder: (_, __) => const MyApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 4));

    expect(find.text('AC.'), findsWidgets);
    expect(find.text('View projects'), findsOneWidget);
    expect(find.text('Flutter Developer | Mobile App Engineer'), findsOneWidget);
    expect(find.text('Where I\'ve worked'), findsOneWidget);
    expect(find.text('Testimonials'), findsNothing);
  });
}
