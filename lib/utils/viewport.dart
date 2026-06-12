import 'package:flutter/material.dart';

enum SiteViewport { mobile, tablet, desktop }

SiteViewport siteViewportOf(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 800) return SiteViewport.mobile;
  if (width < 1200) return SiteViewport.tablet;
  return SiteViewport.desktop;
}

bool isMobile(BuildContext context) =>
    siteViewportOf(context) == SiteViewport.mobile;

double sectionHorizontalPadding(BuildContext context) {
  return switch (siteViewportOf(context)) {
    SiteViewport.mobile => 24,
    SiteViewport.tablet => 64,
    SiteViewport.desktop => 80,
  };
}
