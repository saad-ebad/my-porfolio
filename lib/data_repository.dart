import 'model/project_model.dart';
import 'model/skill_model.dart';

class DataRepository {
  // Your skills with icons
  static final List<Skill> skills = [
    Skill(
      name: 'Flutter',
      icon: '🚀',
      description: 'Production-ready cross-platform apps (Android, iOS, Web)',
      proficiency: 5,
    ),
    Skill(
      name: 'Dart',
      icon: '🎯',
      description: 'Advanced Dart, null safety, async & isolates',
      proficiency: 5,
    ),
    Skill(
      name: 'State Management',
      icon: '⚡',
      description: 'Riverpod & GetX for scalable app architecture',
      proficiency: 5,
    ),
    Skill(
      name: 'Clean Architecture',
      icon: '🏗️',
      description: 'SOLID principles & feature-based architecture',
      proficiency: 4,
    ),
    Skill(
      name: 'REST APIs',
      icon: '🌐',
      description: 'Secure API integration, pagination & error handling',
      proficiency: 5,
    ),
    Skill(
      name: 'AI API Integration',
      icon: '🤖',
      description: 'OpenAI / Gemini APIs, chat & AI-powered features',
      proficiency: 4,
    ),
    Skill(
      name: 'Prompt Engineering',
      icon: '🧠',
      description: 'Designing effective prompts for in-app AI responses',
      proficiency: 4,
    ),
    Skill(
      name: 'Firebase',
      icon: '🔥',
      description: 'Auth, Firestore, Cloud Functions & notifications',
      proficiency: 4,
    ),
    Skill(
      name: 'Local Storage',
      icon: '💾',
      description: 'SQLite & offline-first app strategies',
      proficiency: 4,
    ),
    Skill(
      name: 'UI / UX Engineering',
      icon: '🎨',
      description: 'Responsive layouts, Material & custom design systems',
      proficiency: 4,
    ),
    Skill(
      name: 'Animations & Performance',
      icon: '✨',
      description: 'Smooth animations & performance optimization',
      proficiency: 4,
    ),
    Skill(
      name: 'Testing & CI/CD',
      icon: '🧪',
      description: 'Unit, widget tests & automated builds',
      proficiency: 3,
    ),
  ];

  // Your demo projects (6 projects)
  static final List<Project> projects = [
    Project(
      title: 'Resourceinn – Comprehensive HR & Workforce Management Platform',
      description: 'Resourceinn is a complete HR solution designed to streamline workforce management. Through the mobile app, employees can mark attendance with full attendance history tracking. The platform supports multiple employee requests, including leave, attendance corrections, relaxation, travel, and several other HR-related requests.A robust monthly payroll module is integrated to ensure accurate salary processing, along with additional powerful features that enhance efficiency, transparency, and overall HR operations.',
      technologies: ['Flutter', 'Firebase', 'Riverpod'],
      screenshots: [
      'projects/resourceinn/login.png',
      'projects/resourceinn/dashboard.png',
      'projects/resourceinn/drawer.png',
      'projects/resourceinn/map.png',
      'projects/resourceinn/dashboardb.png',
      'projects/resourceinn/drawerb.png',
      'projects/resourceinn/mapb.png',
      ]
      ,
      demoVideoUrl: 'https://www.youtube.com/watch?v=ziJ9wF5T-Ns&list=PLx2g1Qg13nM48AJ7eIChSpq5WW70SbYUS&index=1',
      githubUrl: 'https://github.com/saadebad/ecommerce-app',
      category: 'Mobile Application',
    ),
    Project(
      title: 'Umrah Shuttle – Uber-Style Ride-Hailing App for Pilgrims',
      description: 'Umrah Shuttle is a ride-scheduling app for pilgrims performing Umrah in Saudi Arabia. Users can book rides by selecting pickup location, destination, and time, with nearby drivers automatically assigned. The app includes secure payments, in-app chat, notifications, and Google Maps–based navigation.An optimized navigation algorithm was implemented to reduce unnecessary Google Maps polyline API calls, lowering costs while maintaining accurate routing. Data encryption was also added to ensure secure data transmission.',
      technologies: ['Flutter', 'Firebase', 'GetX', 'Google Maps', 'Encryprion', 'SignalR'],
      screenshots: [
      'projects/ummrah_shuttle/1.png',
      'projects/ummrah_shuttle/2.png',
      'projects/ummrah_shuttle/3.png',
      'projects/ummrah_shuttle/4.png',
      'projects/ummrah_shuttle/5.png',
      'projects/ummrah_shuttle/6.png',
      'projects/ummrah_shuttle/7.png',
      'projects/ummrah_shuttle/8.png',
      ],
      //demoVideoUrl: 'https://youtu.be/demo',
      githubUrl: 'https://github.com/saadebad/fitness-tracker',
      category: 'Health & Fitness',
    ),
    Project(
      title: 'Offline Secure Vault',
      description: 'Secure Vault is a privacy-focused mobile app for safely storing sensitive data such as passwords, photos, bills, and receipts using encrypted local SQLite storage. Users can create custom categories and enable PIN protection for documents. The app includes secure backup and restore functionality, where data is exported in encrypted .enc format. A unique recovery key is generated during onboarding and is required to decrypt and restore backups. Security and data protection are the core focus of this application.',
      technologies: ['Flutter','Sqflite', 'Riverpod',  'Encryption & Decryption', 'Backup & Restore'],
      screenshots: [
        'projects/secure_vault/1.png',
        'projects/secure_vault/2.png',
        'projects/secure_vault/3.png',
        'projects/secure_vault/4.png',
        'projects/secure_vault/5.png',
        'projects/secure_vault/6.png',
        'projects/secure_vault/7.png',
        'projects/secure_vault/8.png',
        'projects/secure_vault/9.png',
      ],
      demoVideoUrl: 'https://www.youtube.com/watch?v=aHchhFZI-Is&list=PLx2g1Qg13nM48AJ7eIChSpq5WW70SbYUS&index=3',
      githubUrl: 'https://github.com/saadebad/task-manager',
      category: 'Productivity',
    ),
    Project(
      title: 'Pilgrim Management & Support Application',
      description: 'The Pilgrim App is designed to manage and support pilgrims throughout their journey. Pilgrims are securely verified through passport validation via the backend system. A comprehensive family validation module ensures accurate verification by collecting passport details of family members.If a pilgrim encounters any issues during family validation or the Hajj journey, they can raise a support ticket directly within the app. Each issue is assigned to a dedicated team member and resolved through a structured in-app chat system, enabling clear communication and efficient problem resolution.',
      technologies: ['Flutter', 'Firebase', 'Riverpod', 'SignalR', ],
      screenshots: [
        'projects/pilgrim_management/1.png',
        'projects/pilgrim_management/2.png',
        'projects/pilgrim_management/3.png',
        'projects/pilgrim_management/4.png',
        'projects/pilgrim_management/5.png',
        'projects/pilgrim_management/6.png',
      ],
      demoVideoUrl: 'https://www.youtube.com/watch?v=7rhAualDdTs&list=PLx2g1Qg13nM48AJ7eIChSpq5WW70SbYUS&index=2',
      githubUrl: 'https://github.com/saadebad/weather-app',
      category: 'Utility',
    ),
    Project(
      title: 'Multi-Format Barcode & QR Code Scanning and Generation App',
      description: 'Developed a comprehensive mobile application enabling users to seamlessly scan various barcode and QR code formats using the phone''s camera. The app also allows users to generate custom QR codes and a wide range of barcode types. Integrated PayPal for secure and convenient in-app donations, enhancing the user experience with streamlined payment functionality.',
      technologies: ['Flutter', 'Dart', 'Qrcode', 'Barcode', 'Provider'],
      screenshots: [
        'projects/qrcode_app/1.jpeg',
        'projects/qrcode_app/2.jpeg',
        'projects/qrcode_app/3.jpeg',
        'projects/qrcode_app/4.jpeg',
      ],
      demoVideoUrl: 'https://www.youtube.com/watch?v=fS_a_ojjV_k&list=PLx2g1Qg13nM48AJ7eIChSpq5WW70SbYUS&index=4',
      githubUrl: 'https://github.com/saadebad/recipe-app',
      category: 'Food & Cooking',
    ),
    Project(
      title: 'Flashlight Pro',
      description: 'A powerful flashlight app offering high-intensity torch functionality along with strobe and SOS emergency modes, complemented by a screen light feature for enhanced visibility in low-light situations.',
      technologies: ['Flutter', 'Dart', 'Provider'],
      screenshots: [
        'projects/flashlight_app/1.jpeg',
        'projects/flashlight_app/2.jpeg',
        'projects/flashlight_app/3.jpeg',
        'projects/flashlight_app/4.jpeg',
      ],
      demoVideoUrl: 'https://www.youtube.com/watch?v=KTC4_5QAbng&list=PLx2g1Qg13nM48AJ7eIChSpq5WW70SbYUS&index=5',
      githubUrl: 'https://github.com/saadebad/expense-tracker',
      category: 'Finance',
    ),
  ];
}