# beraca_plus_optique

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Architecture
 lib/
├── main.dart
├── app_colors.dart
├── home_page.dart
├── data/
│   └── products.dart
├── utils/
│   └── wa_launcher.dart
├── widgets/
│   ├── announcement_bar.dart
│   └── nav_bar.dart
└── sections/
    ├── hero_section.dart
    ├── stats_section.dart
    ├── collections_section.dart
    ├── why_section.dart
    ├── testimonials_section.dart
    ├── contact_section.dart
    └── footer_section.dart


-------------------- COMMANDS POUR LE DEPLOYEMENT --------------------
# CMD BASH - Initialiser le hosting
- firebase init hosting
# CMD BASH - Appliquer un targ ou spéficie le le projet
- firebase target:apply hosting beraca beracaplus
# CMD BASH - Construire le build
- flutter build web
# CMD BASH - Deployment
- firebase deploy --only hosting:beraca
# Firebase Hosting URL:
[https://beracaplus.web.app](https://beracaplus.web.app)
