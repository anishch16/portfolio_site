/// Portfolio content synced with CV.
class PortfolioData {
  PortfolioData._();

  static const String name = 'Anish Chaulagain';
  static const String title = 'Flutter Developer | Mobile App Engineer';
  static const String location = 'Kathmandu, Nepal';
  static const String email = 'chaulagainanish16@gmail.com';
  static const String phone = '+977-9865499496';
  static const String resumeUrl =
      'https://drive.google.com/file/d/12BLYLP1xbXXPS4AEN_UZOm4kR242s3KB/view?usp=sharing';

  static const String githubUrl = 'https://github.com/anishchaulagain16';
  static const String linkedInUrl =
      'https://www.linkedin.com/in/anish-c-a9a202218';

  static const String professionalSummary =
      'Results-driven Flutter Developer with 3+ years building, testing, and shipping production-grade iOS and Android apps. Proficient in Dart, Bloc/Cubit, Riverpod, and GetX with deep expertise in Clean Architecture and test-driven development. Proven track record integrating Firebase, REST APIs, payment gateways, and offline-first architectures across media, healthcare, fintech, and transport.';

  static const String contactBio =
      'Open to freelance, full-time roles, and product collaborations. Based in Kathmandu — happy to connect about Flutter, mobile architecture, or your next app.';

  static const List<ExperienceEntry> experience = [
    ExperienceEntry(
      company: 'Ankaek Pvt. Ltd.',
      role: 'Flutter Developer',
      dateRange: '04/2024 – Present',
      website: "https://ankaek.com/",
      summary:
          'Shipped production Flutter apps across social, identity, and parking products — from feed modules and push notifications to encrypted multi-persona profiles and payment integrations.',
      projectNames: ['a-OK', 'Connect Persona', 'Lahv+ Parking'],
    ),
    ExperienceEntry(
      company: 'Ayata Incorporation',
      role: 'Flutter Developer',
      dateRange: '01/2023 – 04/2024',
      website: "https://ayata.com.np",
      summary:
          'Built and maintained high-traffic consumer and field-worker apps spanning media streaming, offline healthcare data collection, and nationwide bus ticketing.',
      projectNames: ['Dishhome', 'AshaConnect', 'Kilindar'],
    ),
  ];

  static const EducationEntry education = EducationEntry(
    degree:
        'Bachelor of Science in Computer Science and Information Technology (BSc. CSIT)',
    institution: 'Tribhuvan University, Madan Bhandari Memorial College',
    dateRange: 'April 2021 – September 2025',
  );
}

class ExperienceEntry {
  final String company;
  final String role;
  final String dateRange;
  final String summary;
  final String website;
  final List<String> projectNames;

  const ExperienceEntry({
    required this.company,
    required this.role,
    required this.dateRange,
    required this.summary,
    required this.projectNames,
    required this.website,
  });
}

class EducationEntry {
  final String degree;
  final String institution;
  final String dateRange;

  const EducationEntry({
    required this.degree,
    required this.institution,
    required this.dateRange,
  });
}

class SocialLink {
  final String label;
  final String url;
  final String iconName;

  const SocialLink({
    required this.label,
    required this.url,
    required this.iconName,
  });
}

class SkillCategory {
  final String title;
  final List<String> skills;

  const SkillCategory(this.title, this.skills);
}

class PortfolioProject {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final String category;
  final String company;
  final List<String> tags;
  final String? metric;
  final String? appStoreUrl;
  final String? playStoreUrl;

  const PortfolioProject({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.category,
    required this.company,
    required this.tags,
    this.metric,
    this.appStoreUrl,
    this.playStoreUrl,
  });
}

const portfolioSocialLinks = [
  SocialLink(
    label: 'GitHub',
    url: PortfolioData.githubUrl,
    iconName: 'github',
  ),
  SocialLink(
    label: 'LinkedIn',
    url: PortfolioData.linkedInUrl,
    iconName: 'linkedin',
  ),
];

const skillCategories = [
  SkillCategory('CORE', [
    'Dart',
    'Java (basic)',
    'Flutter',
    'Flutter SDK',
    'Android',
    'iOS',
    'Web',
  ]),
  SkillCategory('STATE MANAGEMENT', [
    'BLoC',
    'Cubit',
    'Riverpod',
    'GetX',
    'Provider',
  ]),
  SkillCategory('ARCHITECTURE', [
    'Clean Architecture',
    'MVVM',
    'MVC',
    'Repository Pattern',
  ]),
  SkillCategory('BACKEND & NETWORKING', [
    'REST APIs',
    'HTTP',
    'Dio',
    'Firebase FCM',
    'Firebase Auth',
    'Firestore',
    'WebSocket',
  ]),
  SkillCategory('DATABASE & STORAGE', [
    'SQLite',
    'sqflite',
    'SharedPreferences',
    'Encrypted Storage',
    'Hive',
  ]),
  SkillCategory('PAYMENTS & AUTH', [
    'Khalti',
    'eSewa',
    'Payment Gateway Integration',
    'In-App Purchases',
    'Google Sign-In',
    'JWT',
    'OAuth 2.0',
  ]),
  SkillCategory('MAPS & LOCATION', [
    'Google Maps API',
    'Real-Time Location Tracking',
    'Geolocator',
  ]),
  SkillCategory('HARDWARE & DEVICE', [
    'Bluetooth Printer Integration',
    'QR Scanner',
    'Camera',
    'Image Capture',
  ]),
  SkillCategory('PERFORMANCE & QA', [
    'CachedNetworkImage',
    'Memory Optimization',
    'Unit Testing',
    'Widget Testing',
    'Mockito',
    'Integration Testing',
  ]),
  SkillCategory('NAVIGATION', [
    'GoRouter',
    'Navigator 2.0',
  ]),
  SkillCategory('UI/UX', [
    'Responsive Design',
    'Material Design',
    'Cupertino (iOS)',
    'Custom Animations',
    'Infinite Scroll Pagination',
  ]),
  SkillCategory('TOOLS & CI/CD', [
    'Git',
    'GitHub',
    'Android Studio',
    'VS Code',
    'Postman',
    'Firebase App Distribution',
  ]),
];

const portfolioProjects = [
  PortfolioProject(
    id: 'aok',
    title: 'a-OK',
    description:
        'Social gratitude app where users send and receive acts of kindness. Built feed and story modules with media handling, like/reaction state, and infinite scroll pagination using Cubit. Optimized performance with CachedNetworkImage and video controller disposal. Integrated FCM for real-time activity alerts.',
    imagePath: 'assets/images/aok.webp',
    category: 'Social',
    company: 'Ankaek Pvt. Ltd.',
    tags: ['Cubit', 'FCM', 'CachedNetworkImage'],
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.a_ok',
  ),
  PortfolioProject(
    id: 'connect_persona',
    title: 'Connect Persona',
    description:
        'Multi-identity profile app for controlled information sharing. Built secure profile management with encrypted storage and Firebase Auth. Designed a multi-persona dashboard for creating and switching identities. Delivered consistent UI/UX across platforms with GoRouter and permission handling.',
    imagePath: 'assets/images/connectPersona.webp',
    category: 'Productivity',
    company: 'Ankaek Pvt. Ltd.',
    tags: ['BLoC', 'GoRouter', 'Secure Storage'],
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.ankaek.aOKconnect',
  ),
  PortfolioProject(
    id: 'lahv',
    title: 'Lahv+ Parking',
    description:
        'Smart parking app for drivers and lot operators. Developed vehicle registration with camera capture and Bluetooth thermal printer integration for invoices. Contributed to Khalti payment integration and real-time slot availability via REST APIs and Dio.',
    imagePath: 'assets/images/lahv.webp',
    category: 'Fintech',
    company: 'Ankaek Pvt. Ltd.',
    tags: ['Dio', 'Khalti', 'Bluetooth'],
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.ankaek.lahvplus_parking_app',
  ),
  PortfolioProject(
    id: 'dishhome',
    title: 'myDishHome',
    description:
        'Self-service app for DishHome customers with 1M+ Play Store downloads. Built scalable features with Clean Architecture and MVVM. Integrated Firebase Google Sign-In, Google Maps, and Khalti/eSewa payment gateways for billing, support tickets, and account management.',
    imagePath: 'assets/images/dishhome.webp',
    category: 'Media',
    company: 'Ayata Inc.',
    tags: ['MVVM', 'Firebase', 'Khalti', 'eSewa'],
    metric: '1M+ downloads',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.shirantech.dishhome',
  ),
  PortfolioProject(
    id: 'asha',
    title: 'AshaConnect',
    description:
        'Offline-first health data collection for rural healthcare workers. Built with GetX and SQLite for reliable use in low-connectivity environments. Implemented local persistence and background sync to reduce data loss during intermittent network conditions.',
    imagePath: 'assets/images/asha.webp',
    category: 'Healthcare',
    company: 'Ayata Inc.',
    tags: ['GetX', 'SQLite', 'Offline-first'],
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.asha.ashaconnect',
  ),
  PortfolioProject(
    id: 'kilindar',
    title: 'Kilindar Merchant',
    description:
        'Operator companion for public transport businesses in Nepal. Resolved complex bus seat layout rendering bugs. Built real-time seat maps, ticket sales, and Bluetooth thermal printing. Integrated Dio for live bus data and dynamic seat availability.',
    imagePath: 'assets/images/kilinder.png',
    category: 'Transport',
    company: 'Ayata Inc.',
    tags: ['Dio', 'Bluetooth', 'REST API'],
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.kilindar.merchant',
  ),
];
