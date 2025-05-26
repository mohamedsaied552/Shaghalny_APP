# Shoghlany - Daily Job Matching App

A Flutter mobile application that connects daily job seekers with employers offering short-term or temporary jobs.

## Features

- User role-based authentication (Worker, Employer, Admin)
- Job posting and management for employers
- Job search and application for workers
- Real-time notifications
- Profile management
- Admin dashboard for user and job management

## Project Structure

```
lib/
├── screens/
│   ├── splash_screen.dart
│   ├── welcome_screen.dart
│   ├── login_screen.dart
│   ├── worker/
│   │   ├── worker_home_screen.dart
│   │   └── ...
│   ├── employer/
│   │   ├── employer_home_screen.dart
│   │   ├── post_job_screen.dart
│   │   └── ...
│   └── admin/
│       └── ...
├── widgets/
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   └── ...
├── theme/
│   └── app_theme.dart
├── models/
├── providers/
├── utils/
└── main.dart
```

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/shoghlany.git
```

2. Navigate to the project directory:
```bash
cd shoghlany
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Dependencies

- google_fonts: ^6.1.0
- flutter_svg: ^2.0.9
- provider: ^6.1.1
- shared_preferences: ^2.2.2
- intl: ^0.19.0
- cached_network_image: ^3.3.1

## UI Components

The app uses a consistent design system with:

- Primary color: #007BFF (blue)
- Secondary color: #F4F7FE (light gray/white background)
- Accent color: #1E1E2F (dark text)
- Custom buttons and text fields
- Material Design icons
- Responsive layouts

## Screens

### Authentication
- Splash Screen
- Welcome Screen
- Login Screen
- Sign Up Screen
- Forgot Password Screen

### Worker Screens
- Home Screen (Available Jobs)
- Job Details Screen
- Applied Jobs Screen
- Profile Screen
- Notifications Screen

### Employer Screens
- Dashboard Screen
- Post Job Screen
- My Jobs Screen
- Applicants List Screen
- Profile Screen

### Admin Screens
- Login Screen
- Dashboard Screen
- User Management Screen
- Job Management Screen

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Material Design for the design system
- All contributors who have helped shape this project
