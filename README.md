# Codekay

A cross-platform daily coding challenge application built with Flutter and Firebase. Codekay helps developers sharpen their problem-solving skills through daily coding questions of varying difficulty levels.

## Features

- **Daily Coding Challenges**: Access coding questions with varying difficulty levels (Easy, Medium, Hard)
- **User Authentication**: Secure email/password authentication powered by Firebase Auth
- **Real-time Updates**: Questions are delivered in real-time using Firestore
- **Cross-Platform**: Runs on iOS, Android, Web, Windows, macOS, and Linux
- **Clean UI**: Modern Material Design 3 interface for an intuitive user experience
- **Answer Submission**: Write and submit solutions directly in the app

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Firebase project with Authentication and Firestore enabled
- Platform-specific requirements:
  - **iOS**: Xcode 14+ and CocoaPods
  - **Android**: Android Studio with Android SDK 21+
  - **Web**: Modern web browser
  - **Desktop**: Platform-specific build tools

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/codekay.git
   cd codekay
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure Firebase:
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Enable Authentication (Email/Password provider)
   - Create a Firestore database
   - Update the Firebase configuration in `lib/config/firebase_config.dart`

4. Run the application:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── config/              # Configuration files
│   └── firebase_config.dart
├── models/              # Data models
│   └── coding_question.dart
├── screens/             # Application screens
│   ├── auth_wrapper.dart
│   ├── home_screen.dart
│   └── login_screen.dart
├── services/            # Business logic and API services
│   ├── auth_service.dart
│   └── question_service.dart
├── utils/               # Utility functions and helpers
│   └── theme_helper.dart
├── widgets/             # Reusable UI components
│   ├── answer_input.dart
│   ├── empty_questions_view.dart
│   └── question_card.dart
└── main.dart           # Application entry point
```

## Firebase Setup

### Firestore Database Structure

Create a `questions` collection in Firestore with documents containing:

```json
{
  "title": "Two Sum",
  "description": "Given an array of integers, return indices of the two numbers that add up to a specific target.",
  "difficulty": "easy"
}
```

**Field Descriptions:**
- `title` (string): The question title
- `description` (string): Detailed problem description
- `difficulty` (string): One of "easy", "medium", or "hard"

### Security Rules

Configure Firestore security rules to protect your data:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /questions/{questionId} {
      allow read: if request.auth != null;
      allow write: if false; // Only admins can write via console
    }
  }
}
```

## Building for Production

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

### Desktop

```bash
# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

## Testing

Run the test suite:

```bash
flutter test
```

## Dependencies

### Core Dependencies
- `flutter` - UI framework
- `firebase_core` - Firebase initialization
- `firebase_auth` - User authentication
- `cloud_firestore` - Cloud database

### Additional Dependencies
- `provider` - State management
- `flutter_markdown` - Markdown rendering support
- `google_fonts` - Typography
- `intl` - Internationalization

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes and version history.

## Support

For issues, questions, or suggestions, please open an issue on the GitHub repository.

## Acknowledgments

- Built with [Flutter](https://flutter.dev)
- Backend powered by [Firebase](https://firebase.google.com)
- Icons from [Material Design Icons](https://material.io/resources/icons)
